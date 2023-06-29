import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../scan_item_vew_screen.dart';

// enum type  {
//   Walkin Customer,
//   Home Delivary
// }

class WidgetRadioButtons extends StatefulWidget {
  const WidgetRadioButtons({super.key});

  @override
  State<WidgetRadioButtons> createState() => _WidgetRadioButtonsState();
}

class _WidgetRadioButtonsState extends State<WidgetRadioButtons> {
  List<String> items = [
    "Walkin Customer",
    "Home Delivary",
  ];

  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = items[0];
  }

  @override
  void reassemble() {
    super.reassemble();

    selectedItem = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: items[0],
            groupValue: selectedItem,
            activeColor: AppTheme.primaryColor,
            onChanged: (value) {
              scanViewScreenController.updateIsHomeDelivery(false);
              setState(() {
                selectedItem = value.toString();
              });
            },
          ),
          Text(
            items[0],
            style: TextStyle(
              fontFamily: "Gordita",
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Radio(
            value: items[1],
            groupValue: selectedItem,
            activeColor: AppTheme.primaryColor,
            onChanged: (value) {
              scanViewScreenController.updateIsHomeDelivery(true);
              setState(() {
                selectedItem = value.toString();
              });
            },
          ),
          Text(
            items[1],
            style: TextStyle(
              fontFamily: "Gordita",
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
