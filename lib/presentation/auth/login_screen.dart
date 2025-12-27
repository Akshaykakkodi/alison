import 'package:alison_test/application/auth/auth_bloc.dart';
import 'package:alison_test/application/core/theme/app_colors.dart';
import 'package:alison_test/application/core/theme/app_styles.dart';
import 'package:alison_test/application/utils/app_assets.dart';
import 'package:alison_test/domain/core/mixin/validation_mixin.dart';
import 'package:alison_test/presentation/home/home_screen.dart';
import 'package:alison_test/presentation/widgets/custom_text_field.dart';
import 'package:alison_test/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObsecure = true;
  void _changePasswordVisibility() {
    isObsecure = !isObsecure;
    setState(() {});
  }

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.loginBanner,
                height: 390.h,
                width: 390.w,
                fit: BoxFit.cover,
              ),
              Gap(27.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login", style: AppStyle.text30f600),
                    Gap(27.h),
                    Text("Email Address", style: AppStyle.text16f500),
                    Gap(10.h),
                    CustomTextFormField(
                      hintText: "Email",
                      controller: emailController,
                      enabledBorder: false,
                      validator: (value) => validateEmail(value),
                    ),
                    Gap(10.h),
                    Text("Password", style: AppStyle.text16f500),
                    Gap(10.h),
                    CustomTextFormField(
                      obscureText: isObsecure,
                      controller: passwordController,
                      validator: (value) => validatePassword(value),
                      maxLines: 1,
                      hintText: "Password",
                      enabledBorder: false,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _changePasswordVisibility();
                        },
                        child: Icon(
                          isObsecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 18,
                          color: AppColors.grey,
                        ),
                      ),
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: AppStyle.text14f400.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Gap(20.h),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state.loginState == ApiStatus.success) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      },
                      listenWhen: (previous, current) =>
                          previous.loginState != current.loginState,
                      builder: (context, authState) {
                        return PrimaryButton(
                          title: "Login",
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            //   context.read<AuthBloc>().add(
                            //     Login(
                            //       emailController.text,
                            //       passwordController.text,
                            //     ),
                            //   );
                            // }
                            ////********* */ APi not working , 500 status code **************///////
                            ///so navigating manually

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Gap(20.h),

                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: AppStyle.text14f400,
                          children: [
                            const TextSpan(text: "Don’t have an account? "),
                            TextSpan(
                              text: "Sign Up",
                              style: AppStyle.text14f500.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
