import 'dart:io';

import 'package:alison_test/application/utils/logger.dart';
import 'package:alison_test/application/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@lazySingleton
class DioClient {
  final Dio dio;
  String? token;
  late String fcmToken;

  DioClient(this.dio) {
    dio
      ..options.baseUrl = Urls.apiVersionUrl
      ..options.connectTimeout = const Duration(milliseconds: 60000)
      ..options.receiveTimeout = const Duration(milliseconds: 60000);
    dio.interceptors.add(PrettyDioLogger(requestBody: true));

    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            // TODO Navigate
          } else {
            return handler.next(error);
          }
        },
      ),
    );
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on SocketException catch (e) {
      Logger.logError(e);
      // print("no network - 1");
      throw CustomException(errMsg: e.toString());
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      Logger.logError("Dio Get Error: $e");

      if (e is DioException && e.message == "No internet connection") {
        Logger.logWarning(e.response);
        throw CustomException(errMsg: e.message ?? '');
      }

      if (e is DioException) {
        final message = e.response?.data['message'];

        throw CustomException(errMsg: '$message');
      }

      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  Future<Response> downloadFile(
    String url,
    String savePath, {
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.download(
        url,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        return response;
      } else {
        throw CustomException(errMsg: "Failed to download file");
      }
    } catch (e) {
      Logger.logError("Dio Download Error: $e");

      if (e is DioException) {
        final message = e.response?.data['message'] ?? 'Download error';
        throw CustomException(errMsg: message.capitalize);
      }

      throw CustomException(errMsg: "Unknown download error occurred");
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      // print("no network - 1");
      throw CustomException(errMsg: e.toString());
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } on DioException catch (e) {
      Logger.logError(e.errorMessage);
      if (e.message == "No internet connection") {
        throw CustomException(errMsg: "No internet connection");
      }
      if (e.type == DioExceptionType.cancel) {
        throw CustomException(errMsg: 'Canceld By User');
      }

      throw CustomException(errMsg: e.errorMessage);
    } catch (_) {
      throw CustomException(errMsg: "Unknown error occurred");
    }
  }

  Future<Response> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw CustomException(errMsg: e.toString());
    } on FormatException {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? '');
      }
      if (e is DioException) {
        final message = e.response?.data['message'];
        throw CustomException(errMsg: '$message');
      }
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? '');
      }
      if (e is DioException) {
        final message = e.response?.data['message'];

        throw CustomException(errMsg: '$message');
      }
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw CustomException(errMsg: "Unable to process the data");
    } catch (e) {
      if (e is DioException && e.message == "No internet connection") {
        throw CustomException(errMsg: e.message ?? '');
      }
      if (e is DioException) {
        final message = e.response?.data['message'];

        throw CustomException(errMsg: '$message');
      }
      throw CustomException(errMsg: e.toString());
    }
  }
}

class CustomException {
  final String errMsg;
  CustomException({required this.errMsg});
}

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    DateTime now = DateTime.now().toUtc();
    // String? token = box.read(AppConstants.token);
    options.headers.addAll({
      'Timestamp': now.millisecondsSinceEpoch,
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ',
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Device-Type': Platform.isAndroid
          ? 1
          : Platform.isIOS
          ? 2
          : 0,
      // 'Device-Token': AppConstants.fcmToken ?? "",
      // 'Language': di.sl<LanguageBloc>().locale.languageCode,
      // 'User-Agent': AppConstants.userAgent ?? {}
    });

    Logger.logWarning("Headers: ${options.headers.toString()}");
    Logger.logWarning("Parms: ${options.data.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    try {
      if (response.statusCode == 201 || response.statusCode == 200) {
        return super.onResponse(response, handler);
      } else if (response.data['status'] == true) {
        return response.data['status'] == true
            ? super.onResponse(response, handler)
            : handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  error: response.data,
                  response: response,
                  type: DioExceptionType.unknown,
                ),
              );
        //newly added else
      } else {
        return response.data['status'] == true
            ? super.onResponse(response, handler)
            : handler.reject(
                DioException(
                  requestOptions: response.requestOptions,
                  error: response.data,
                  response: response,
                  type: DioExceptionType.unknown,
                ),
              );
      }
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: "Something went wrong",
          response: response,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}

extension DioExceptionExtension on DioException {
  String get errorMessage => _getErrorMsg(this);

  String _getErrorMsg(DioException e) {
    Logger.logError(e);
    switch (e.type) {
      case DioExceptionType.cancel:
        return "Request to server was cancelled";
      case DioExceptionType.connectionError:
        return "Connection timeout with server";

      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with server";
      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 500) {
          return "Internal server error";
        }

        if (e.response?.statusCode == 400) {
          return e.response?.message ?? "Internal server error";
        }

        if (e.response!.statusCode == 404) {
          return "Internal server error";
        }

        return e.response?.message ?? "Failed to load data";
      case DioExceptionType.sendTimeout:
        return "Send timeout with server";
      case DioExceptionType.unknown:
      default:
        return "Unexpected error occurred";
    }
  }
}

extension ResponseX on Response {
  bool get isOk => statusCode == 200 || statusCode == 201;
  dynamic get responseData => data['data'];
  String get message => data['message'];
}
