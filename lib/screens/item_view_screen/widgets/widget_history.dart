import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';

class widgetHistory extends StatelessWidget {
  const widgetHistory({
    Key? key,
    required List<String> taskValues,
    required List<String> taskTime,
  })  : _taskValues = taskValues,
        _taskTime = taskTime,
        super(key: key);

  final List<String> _taskValues;
  final List<String> _taskTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "History",
                style: TextStyle(
                  fontFamily: "Gordita",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.primaryColor,
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  indent: 10.w,
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  _taskValues.length + 1,
                  (index) => index == 0
                      ? Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            "Status",
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            _taskValues[index - 1],
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  _taskTime.length + 1,
                  (index) => index == 0
                      ? Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Text(
                            "Time",
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Text(
                            _taskTime[index - 1],
                            style: TextStyle(
                              fontFamily: "Gordita",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                ),
              ),
              Spacer()
            ],
          )
        ],
      ),
    );
  }
}
