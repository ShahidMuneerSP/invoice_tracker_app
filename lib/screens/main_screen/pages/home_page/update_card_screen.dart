import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_tracker_main_app/apis/assign_task_details/update_assign_task.dart';
import 'package:invoice_tracker_main_app/apis/employee/api_get_employee.dart';
import 'package:invoice_tracker_main_app/apis/task/api_get_task.dart';
import 'package:invoice_tracker_main_app/models/employee_model.dart';
import 'package:invoice_tracker_main_app/models/task_model.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/home_page/home_page.dart';
import 'package:invoice_tracker_main_app/screens/main_screen/pages/history_page/history_page.dart';
import 'package:invoice_tracker_main_app/screens/scan_item_view_screen/widgets/radio_buttons_widgets.dart';
import '../../../../animations/animated_content.dart';
import '../../../../apis/assign_task_details/get_assign_task.dart';
import '../../../../controllers/update_card_screen_controller.dart';
import '../../../../theme/theme.dart';
import '../../../item_view_screen/widgets/widget_appBar.dart';
import '../../../item_view_screen/widgets/widget_cardTop.dart';

///this is the page to show scanned item
///this screen appear after scanning an item

///screen controller
UpdateCardScreenController updateCardScreenController =
    UpdateCardScreenController();

// ignore: must_be_immutable
class UpdateCardScreen extends StatefulWidget {
  UpdateCardScreen({
    super.key,
    required this.name,
    required this.dateTime,
    required this.invoiceNumber,
    required this.price,
    required this.vat,
    required this.index,
    required this.isHomeDelivery,
    required this.taskName,
    required this.empName,
  });

  String name;
  String invoiceNumber;
  String dateTime;
  String price;
  String vat;
  bool isHomeDelivery;
  final int index;
  final String taskName;
  final String empName;

  @override
  State<UpdateCardScreen> createState() => _UpdateCardScreenState();
}

class _UpdateCardScreenState extends State<UpdateCardScreen> {
  Map<String, dynamic>? dataModel;
  String? selectedTask;
  String? selectedEmployee;
  List taskListItem = [];
  List employeeListItem = [];
  List<TaskModel>? taskList = [];
  List<EmployeeModel>? employeeList = [];
  String taskNameValue = "";

  @override
  void initState() {
    super.initState();
    log(widget.isHomeDelivery.toString());
    updateCardScreenController.updateIsHomeDelivery(widget.isHomeDelivery);
    getData();
    getTaskData();
    getEmployeeData();
  }

  getData() async {
    dataModel =
        await getAssignTaskApi(homeScreenController.data[widget.index].id);
    log(dataModel.toString());
  }

  getEmployeeData() async {
    employeeList = await apiGetEmployee();
    employeeListItem.clear();
    employeeList?.forEach((element) {
      employeeListItem.add(element.name);
    });
    employeeList?.forEach((element) {
      if (element.name == widget.empName) {
        selectedEmployee = element.name;
      }
    });
    setState(() {});
  }

  getTaskData() async {
    taskList = await apiGetTask();
    taskListItem.clear();
    taskList?.forEach((element) {
      taskListItem.add(element.taskName);
    });
    taskList?.forEach((element) {
      if (element.taskName == widget.taskName) {
        selectedTask = element.taskName;
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            widgetAppBar(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: SingleChildScrollView(
                  child: Form(
                    // key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),

                        ///invoice details card on top
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: WidgetCardTop(
                            name: widget.name,
                            invoiceNumber: widget.invoiceNumber,
                            dateTime: widget.dateTime,
                            price: widget.price,
                            // vat: widget.vat,
                          ),
                        ),

                        ///radio buttons
                        const AnimatedContent(
                            show: true,
                            leftToRight: 0.0,
                            topToBottom: 5.0,
                            time: 2000,
                            child: RadioButtonWidgets()),

                        ///select employee
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: DropdownButton(
                                isExpanded: true,
                                hint: const Text(
                                  "Select Employee",
                                  selectionColor: Colors.black,
                                ),
                                value: selectedEmployee,
                                items: employeeListItem.map((category) {
                                  return DropdownMenuItem(
                                      value: category, child: Text(category));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedEmployee = value.toString();
                                  });
                                }),
                          ),
                        ),
                        // AnimatedContent(
                        //   show: true,
                        //   leftToRight: 0.0,
                        //   topToBottom: 5.0,
                        //   time: 2000,
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                        //     child: CustomDropDownMenu(
                        //       controller: employeeController,
                        //       hintText: "Select Employee",
                        //       maxHeight: 200.h,
                        //       maxWidth:
                        //           MediaQuery.of(context).size.width - 50.w,
                        //       items: _employeeValues,
                        //       values: _employeeValues,
                        //       validatorText: "Please select employee",
                        //       onSelected: () {},
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: 25.h,
                        ),

                        ///select task
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: DropdownButton(
                                isExpanded: true,
                                hint: const Text(
                                  "Select Task",
                                  selectionColor: Colors.black,
                                ),
                                value: selectedTask,
                                items: taskListItem.map((category) {
                                  return DropdownMenuItem(
                                      value: category, child: Text(category));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedTask = value.toString();
                                  });
                                }),
                          ),
                        ),
                        // AnimatedContent(
                        //   show: true,
                        //   leftToRight: 0.0,
                        //   topToBottom: 5.0,
                        //   time: 2000,
                        //   child: Container(
                        //     padding: EdgeInsets.symmetric(horizontal: 15.w),
                        //     child: CustomDropDownMenu(
                        //       controller: taskController,
                        //       hintText: "Select Task",
                        //       maxHeight: 200.h,
                        //       maxWidth:
                        //           MediaQuery.of(context).size.width - 50.w,
                        //       items: _taskValues,
                        //       values: _taskValues,
                        //       validatorText: "Please select task",
                        //       onSelected: () {},
                        //     ),
                        //   ),
                        // ),

                        SizedBox(
                          height: 30.h,
                        ),

                        ///button
                        AnimatedContent(
                          show: true,
                          leftToRight: 0.0,
                          topToBottom: 5.0,
                          time: 2000,
                          child: GestureDetector(
                            onTap: () async => showDialog(
                                context: context,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    content:
                                        const Text('Do you want to Change?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () async {
                                            log(dataModel.toString());
                                            String startTime =
                                                dataModel?['start_time'] ??
                                                    "00:00:00";
                                            String pickEndTime =
                                                dataModel?['pick_end_time'] ??
                                                    "00:00:00";
                                            String checkStartTime = dataModel?[
                                                    'check_start_time'] ??
                                                "00:00:00";
                                            log(checkStartTime.toString());
                                            String checkEndTime =
                                                dataModel?['check_end_time'] ??
                                                    "00:00:00";
                                            String deliveryStartTime =
                                                dataModel?[
                                                        'ready_for_delivery'] ??
                                                    "00:00:00";
                                            String deliveredTime =
                                                dataModel?['delivered_time'] ??
                                                    "00:00:00";
                                            int taskId = 0;
                                            int employeeId = 0;
                                            String taskName = "";
                                            String empName = "";

                                            String billNo =
                                                widget.invoiceNumber;

                                            double billAmount =
                                                double.parse(widget.price);

                                            var formattedDate =
                                                DateTime.parse(widget.dateTime);
                                            String billDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(formattedDate);

                                            taskList?.forEach((element) {
                                              // ignore: unrelated_type_equality_checks
                                              if (element.taskName ==
                                                  selectedTask) {
                                                taskId = element.id!;
                                              }
                                            });
                                            employeeList?.forEach((element) {
                                              // ignore: unrelated_type_equality_checks
                                              if (element.name ==
                                                  selectedEmployee) {
                                                employeeId = element.id!;
                                              }
                                            });
                                            taskList?.forEach((element) {
                                              // ignore: unrelated_type_equality_checks
                                              if (element.taskName ==
                                                  selectedTask) {
                                                taskName = element.taskName!;
                                              }
                                            });
                                            employeeList?.forEach((element) {
                                              // ignore: unrelated_type_equality_checks
                                              if (element.name ==
                                                  selectedEmployee) {
                                                empName = element.name!;
                                              }
                                            });
                                            bool homeDelivery =
                                                updateCardScreenController
                                                    .isHomeDelivery.value;
                                            log(homeDelivery.toString());
                                            // print(taskName.toString());
                                            // print(homeDelivery.toString());
                                            // print(empName.toString());
                                            final id = homeScreenController
                                                .data[widget.index].id;
                                            // print(id.toString());
                                            // print(taskId.toString());
                                            // print(employeeId.toString());
                                            // print(billDate.toString());
                                            // print(billAmount.toString());
                                            // print(billNo.toString());

                                            bool data = await updateAssignApi(
                                                taskName,
                                                id,
                                                homeDelivery,
                                                empName,
                                                taskId,
                                                employeeId,
                                                billNo,
                                                billAmount,
                                                billDate,
                                                startTime,
                                                pickEndTime,
                                                checkStartTime,
                                                checkEndTime,
                                                deliveryStartTime,
                                                deliveredTime);
                                            print(data.toString());
                                            if (data == true) {
                                              homeScreenController.getData();
                                              historyScreenController.getData();
                                              Get.back();
                                              Get.back();
                                              print("Update Successfully");
                                            } else {
                                              print("Update Failed");
                                            }
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: AppTheme.primaryColor),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            // Close the dialog
                                            Get.back();
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(
                                                color: AppTheme.primaryColor),
                                          ))
                                    ],
                                  );
                                }),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppTheme.primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontFamily: 'Gordita',
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
