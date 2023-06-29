import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import '../../theme/theme.dart';

class CustomDropDownMenu extends StatefulWidget {
  CustomDropDownMenu({
    required this.controller,
    required this.hintText,
    required this.maxHeight,
    required this.maxWidth,
    required this.items,
    required this.values,
    required this.validatorText,
    required this.onSelected,
  });

  final TextEditingController controller;
  final String hintText;
  final double maxHeight;
  final double maxWidth;
  final List values;
  final List<String> items;
  final String validatorText;
  final Callback onSelected;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  //create items

  var fieldValue = '';

  final GlobalKey _popupMenuKey = GlobalKey();

  List<PopupMenuItem> items = [
    PopupMenuItem(
      value: 20,
      child: Container(
        child: const Text(
          "(Select)",
        ),
      ),
    ),
  ];

  //set items to dropdown list
  setitems() {
    items.clear();
    // if (widget._items.isNotEmpty || widget._values.isNotEmpty) {
    for (int i = 0; i < items.length; i++) {
      items.add(
        PopupMenuItem(
          value: widget.values[i],
          child: Container(
            // width: MediaQuery.of(context).size.width,
            child: Text(
              widget.items[i].toString(),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget._items.toString());
    items.clear();
    for (int i = 0; i < widget.items.length; i++) {
      items.add(
        PopupMenuItem(
          value: widget.values[i],
          child: Container(
            // width: MediaQuery.of(context).size.width,
            child: Text(
              widget.items[i].toString(),
            ),
          ),
        ),
      );
    }
    // setitems();
    return PopupMenuButton(
      constraints: BoxConstraints(
        // maxHeight:,
        minWidth: widget.maxWidth,
        maxHeight: widget.maxHeight,
      ),
      key: _popupMenuKey,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      onSelected: (value) {
        for (int i = 0; i < widget.items.length; i++) {
          if (widget.values[i] == value) {
            widget.controller.text = widget.items[i];
          }
        }

        widget.onSelected;
      },
      child: TextFormField(
        // autofocus: true,
        onTap: () {
          dynamic state = _popupMenuKey.currentState;
          state.showButtonMenu();
        },
        validator: (value) {
          if (value == null || value.isEmpty || value.trim().isEmpty) {
            return widget.validatorText;
          }
        },
        readOnly: true,
        enabled: widget.items.isEmpty ? false : true,
        controller: widget.controller,
        cursorColor: AppTheme.primaryColor,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: Colors.black38,
              width: 1,
            ),
          ),
          labelText: widget.hintText,
          labelStyle: const TextStyle(
            color: Colors.black87,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.black38,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: Colors.black38,
              width: 1,
            ),
          ),
          suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded,
              color: Colors.black87),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
              width: 1.5,
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 15.w, right: 10.w, top: 15.h, bottom: 15.h),
        ),
        style: const TextStyle(
          color: Colors.black87,
        ),
      ),
      itemBuilder: (context) {
        return items;
      },
    );
  }
}
