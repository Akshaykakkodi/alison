import 'package:alison_test/application/auth/auth_bloc.dart';
import 'package:alison_test/domain/auth/auth_facade.dart';
import 'package:alison_test/domain/core/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(sl<AuthFacade>())),
      ],
      child: child,
    );
  }
}
