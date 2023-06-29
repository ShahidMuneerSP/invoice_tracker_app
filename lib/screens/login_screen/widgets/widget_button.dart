import 'dart:math';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/apis/auth/api_Login.dart';
import '../../../animations/animated_content.dart';
import '../../../controllers/login/login_screen_controller.dart';
import '../../../theme/theme.dart';
import '../../main_screen/main_screen.dart';
import '../view_models/save_data.dart';

Widget widgetButton(
  GlobalKey<FormState> _formKey,
  TextEditingController username,
  TextEditingController password,
  LoginScreenController loginScreenController,
) {
  return
   AnimatedContent(
    show: true,
    leftToRight: 20.0,
    topToBottom: 0.0,
    time: 2000,
    child: 
    GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          loginScreenController.isLoading(true);
          var data = await login(username.text, password.text);
          print(data.toString());

          if (data != null) {
            loginScreenController.isAuthFailed(false);
            // bool status = await saveData(data);
            loginScreenController.isLoading(false);
            // if (status) {
            Get.offAll(() => const MainScreen());
            // Get.to(() => const MainScreen());
            // }
          } else {
            loginScreenController.isAuthFailed(true);
            loginScreenController.isLoading(false);
          }
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 17.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppTheme.primaryColor,
        ),
        child: Center(
          child: Obx(
            () => loginScreenController.isLoading.value
                ? SizedBox(
                    height: 20.r,
                    width: 20.r,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    ),
  );
}
