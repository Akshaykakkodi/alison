import 'package:alison_test/app_providers.dart';
import 'package:alison_test/application/core/theme/app_theme.dart';
import 'package:alison_test/domain/core/injection.dart';
import 'package:alison_test/presentation/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_dropdown_alert/dropdown_alert.dart';

void main() async {
  await configureDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var designSize = const Size(390, 844);

    return ScreenUtilInit(
      designSize: designSize,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;
        return fontSize * scaleWidth;
      },
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AppBlocProviders(
          child: MaterialApp(
            title: 'Alison',
            theme: AppTheme.getTheme(),
            debugShowCheckedModeBanner: false,
            home: const LoginScreen(),
            builder: (context, child) {
              const ScreenUtilInit();
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: Stack(children: [child!, const DropdownAlert()]),
              );
            },
          ),
        );
      },
    );
  }
}
