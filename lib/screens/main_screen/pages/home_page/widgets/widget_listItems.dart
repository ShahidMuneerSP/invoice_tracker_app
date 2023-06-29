import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:invoice_tracker_main_app/screens/item_view_screen/view_models/dateTime_formate.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/home_page/home_page.dart';
import 'package:invoice_tracker_main_app/theme/theme.dart';

import '../../../../../animations/animated_content.dart';
import '../update_card_screen.dart';
import 'widget_contentText.dart';

Widget widgetListItems() {
  return AnimatedContent(
    show: true,
    leftToRight: 0.0,
    topToBottom: 2.0,
    time: 1500,
    child: ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: homeScreenController.data.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: (() => Get.to(() => UpdateCardScreen(
              index: index,
              name: "Barakat Indian Restaurant For Serving Meals",
              dateTime: "${homeScreenController.data[index].billDate}",
              invoiceNumber: homeScreenController.data[index].billNo,
              price: "${homeScreenController.data[index].billAmount}",
              vat: "1120.05",
              isHomeDelivery: homeScreenController.data[index].homeDelivery,
              taskName: homeScreenController.data[index].taskRelation.taskName,
              empName: homeScreenController.data[index].empRelation.name,
            ))),
        child: homeScreenController.data[index].taskRelation.id == 6
            ? Container()
            : Container(
                margin: EdgeInsets.only(
                    left: 10.w, right: 10.w, top: 6.h, bottom: 6.h),
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: 15.h,
                  bottom: 10.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        widgetContentText(
                            title: "Bill Number:",
                            subtitle: homeScreenController.data[index].billNo),
                        const Spacer(),
                        Text(
                          homeScreenController.data[index].startTime,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    widgetContentText(
                      title: "Bill Date:",
                      subtitle:convertDateTime("${homeScreenController.data[index].billDate}"),
                      
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    widgetContentText(
                      title: "Bill Amount:",
                      subtitle:
                          "${homeScreenController.data[index].billAmount}",
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        homeScreenController.data[index].homeDelivery == true
                            ? Text(
                                "Home Delivery",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: "Gordita",
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 143, 75, 1)),
                              )
                            : Text(
                                "Walkin Customer",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: "Gordita",
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromRGBO(0, 143, 75, 1)),
                              ),
                        const Spacer(),
                        Text(
                          homeScreenController.data[index].empRelation.name,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: "Gordita",
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 5.h),
                          decoration: BoxDecoration(
                            color:homeScreenController.data[index].taskRelation.id == 5?const Color.fromRGBO(18, 179, 71, 0.25): const Color.fromRGBO(255, 213, 0, 0.26),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            homeScreenController
                                .data[index].taskRelation.taskName,
                            style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: "Gordita",
                                fontWeight: FontWeight.w500,
                                color:
                                homeScreenController.data[index].taskRelation.id == 5? AppTheme.buttonGreenColor: const Color.fromRGBO(143, 120, 0, 1)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    ),
  );
}
