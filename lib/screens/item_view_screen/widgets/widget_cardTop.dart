import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/cardTop_text_model.dart';

class WidgetCardTop extends StatelessWidget {
  const WidgetCardTop({
    Key? key,
    required this.name,
    required this.invoiceNumber,
    required this.dateTime,
    required this.price,
    // required this.vat,
  }) : super(key: key);

  final String name;
  final String invoiceNumber;
  final String dateTime;
  final String price;
  // final String vat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.black26, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///title
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 18.r,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'INVOICE DETAILS',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: "Gordita",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          const Divider(
            color: Colors.black45,
            thickness: 2,
          ),

          ///name
          SizedBox(
            height: 10.h,
          ),
          widgetTextView(title: "Seller’s Name:", subTitle: name),
          SizedBox(
            height: 10.h,
          ),
          const DottedLine(
            lineThickness: 2,
            dashColor: Colors.black38,
          ),

          ///Invoice No
          SizedBox(
            height: 10.h,
          ),
          widgetTextView(title: "Invoice No:", subTitle: invoiceNumber),
          SizedBox(
            height: 10.h,
          ),
          const DottedLine(
            lineThickness: 2,
            dashColor: Colors.black38,
          ),

          ///name
          SizedBox(
            height: 10.h,
          ),
          widgetTextView(
            title: "Invoice Date & Time:",
            // subTitle: convertDateTime(dateTime),
            subTitle: dateTime,
          ),
          SizedBox(
            height: 10.h,
          ),
          const DottedLine(
            lineThickness: 2,
            dashColor: Colors.black38,
          ),

          ///name
          SizedBox(
            height: 10.h,
          ),
          widgetTextView(title: "Invoice Total:", subTitle: price),
          SizedBox(
            height: 10.h,
          ),
          // const DottedLine(
          //   lineThickness: 2,
          //   dashColor: Colors.black38,
          // ),

          ///name
          // SizedBox(
          //   height: 10.h,
          // ),
          // widgetTextView(title: "VAT Total:", subTitle: vat),
          // SizedBox(
          //   height: 10.h,
          // ),
        ],
      ),
    );
  }
}
