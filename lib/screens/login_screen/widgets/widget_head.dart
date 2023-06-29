import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../animations/animated_content.dart';
import '../../../constants/constant_files.dart';

///logo and title
class WidgetHead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedContent(
      show: true,
      leftToRight: 0.0,
      topToBottom: 20.0,
      time: 1500,
      child: Column(
        children: [
          SvgPicture.asset(
            ConstantFiles().logo_primary,
            width: 50.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Gordita',
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
