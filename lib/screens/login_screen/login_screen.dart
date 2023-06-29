import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/controllers/login/login_screen_controller.dart';
import '../../theme/theme.dart';
import 'widgets/widget_button.dart';
import 'widgets/widget_head.dart';
import 'widgets/widget_password.dart';
import 'widgets/widget_username.dart';

///login screen
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ///controllers
    LoginScreenController loginScreenController = LoginScreenController();
    TextEditingController usenameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetHead(),
                  SizedBox(
                    height: 50.h,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        widgetUsername(usenameController),
                        SizedBox(
                          height: 15.h,
                        ),
                        widgetPassword(passwordController),
                        SizedBox(
                          height: 30.h,
                        ),
                        widgetButton(_formKey, usenameController,
                            passwordController, loginScreenController),
                        SizedBox(
                          height: 50.h,
                        ),
                        Obx(
                          () => loginScreenController.isAuthFailed.value
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Failed..!\nIncorrect username or password',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
