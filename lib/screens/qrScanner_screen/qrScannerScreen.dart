import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/qrScanner_screen/widgets/widget_scan_code.dart';
import '../../theme/theme.dart';
import 'widgets/widget_appBar.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widgetAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scan QR Code',
                    style: TextStyle(
                      fontFamily: "Gordita",
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 90.h,
                  ),
                  SvgPicture.asset(
                    "assets/icons/qr_scan_main.svg",
                    width: 200.w,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  GestureDetector(
                    onTap: (() => Get.to(() => const ScanQrCodeScreen())),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      padding: EdgeInsets.symmetric(vertical: 15.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Text(
                          'Scan',
                          style: TextStyle(
                            fontFamily: "Gordita",
                            fontSize: 13.sp,
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
