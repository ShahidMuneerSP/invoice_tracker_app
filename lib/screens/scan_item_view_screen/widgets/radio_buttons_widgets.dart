import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';
import '../../main_screen/pages/home_page/update_card_screen.dart';

class RadioButtonWidgets extends StatefulWidget {
  const RadioButtonWidgets({super.key});

  @override
  State<RadioButtonWidgets> createState() => _RadioButtonWidgetsState();
}

class _RadioButtonWidgetsState extends State<RadioButtonWidgets> {
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
              updateCardScreenController.updateIsHomeDelivery(false);
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
              updateCardScreenController.updateIsHomeDelivery(true);
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
