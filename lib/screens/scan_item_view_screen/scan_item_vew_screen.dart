import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:invoice_tracker_main_app/apis/assign_task_details/post_assign_task.dart';
import 'package:invoice_tracker_main_app/apis/employee/api_get_employee.dart';
import 'package:invoice_tracker_main_app/apis/task/api_get_task.dart';
import 'package:invoice_tracker_main_app/controllers/scanView_screen_controller.dart';
import 'package:invoice_tracker_main_app/models/employee_model.dart';
import 'package:invoice_tracker_main_app/models/task_model.dart';
import '../../animations/animated_content.dart';
import '../../theme/theme.dart';
import '../main_screen/pages/home_page/home_page.dart';
import 'widgets/widget_appBar.dart';
import 'widgets/widget_cardTop.dart';
import 'widgets/widget_radioButtons.dart';

///this is the page to show scanned item
///this screen appear after scanning an item

///screen controller
ScanViewScreenController scanViewScreenController = ScanViewScreenController();

// ignore: must_be_immutable
class ScanItemViewScreen extends StatefulWidget {
  ScanItemViewScreen({
    super.key,
    required this.name,
    required this.dateTime,
    required this.invoiceNumber,
    required this.price,
    required this.vat,
  });

  String name;
  String invoiceNumber;
  String dateTime;
  String price;
  String vat;

  @override
  State<ScanItemViewScreen> createState() => _ScanItemViewScreenState();
}

class _ScanItemViewScreenState extends State<ScanItemViewScreen> {
  String? selectedTask;
  String? selectedEmployee;
  List taskListItem = [];
  List employeeListItem = [];

  List<TaskModel>? taskList = [];
  List<EmployeeModel>? employeeList = [];
  @override
  void initState() {
    getTaskData();
    getEmployeeData();
  }

  getEmployeeData() async {
    employeeList = await apiGetEmployee();
    employeeListItem.clear();
    employeeList?.forEach((element) {
      employeeListItem.add(element.name);
    });
    setState(() {});
  }

  getTaskData() async {
    taskList = await apiGetTask();
    taskListItem.clear();
    taskList?.forEach((element) {
      taskListItem.add(element.taskName);
      // taskListItem.add(element.id.toString());
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
                            vat: widget.vat,
                          ),
                        ),

                        ///radio buttons
                        const AnimatedContent(
                            show: true,
                            leftToRight: 0.0,
                            topToBottom: 5.0,
                            time: 2000,
                            child: WidgetRadioButtons()),

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
                            onTap: () async {
                              bool homeDelivery =
                                  scanViewScreenController.isHomeDelivery.value;
                              double billAmount = double.parse(widget.price);
                              int taskId = 0;
                              int employeeId = 0;
                              String taskName = "";
                              String empName = "";
                              int age = 0;
                              String nationality = "";
                              String workId = "";
                              //workId
                              employeeList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.name == selectedEmployee) {
                                  workId = element.workId!;
                                }
                              });
                              //nationality
                              employeeList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.name == selectedEmployee) {
                                  nationality = element.nationality!;
                                }
                              });
                              //age
                              employeeList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.name == selectedEmployee) {
                                  age = element.age!;
                                }
                              });
                              //taskId
                              taskList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.taskName == selectedTask) {
                                  taskId = element.id!;
                                }
                              });
                              //employeeId
                              employeeList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.name == selectedEmployee) {
                                  employeeId = element.id!;
                                }
                              });
                              //taskName
                              taskList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.taskName == selectedTask) {
                                  taskName = element.taskName!;
                                }
                              });
                              //empName
                              employeeList?.forEach((element) {
                                // ignore: unrelated_type_equality_checks
                                if (element.name == selectedEmployee) {
                                  empName = element.name!;
                                }
                              });
                              //statTime
                              var formattedTime =
                                  DateTime.parse(widget.dateTime);
                              String startTime =
                                  DateFormat('hh:mm:ss').format(formattedTime);
                              //dateTime
                              var formattedDate =
                                  DateTime.parse(widget.dateTime);
                              String dateTime = DateFormat('yyyy-MM-dd')
                                  .format(formattedDate);

                              bool data = await assignTaskApi(
                                  taskName,
                                  taskId,
                                  employeeId,
                                  widget.invoiceNumber,
                                  billAmount,
                                  dateTime,
                                  homeDelivery,
                                  empName,
                                  startTime,
                                  age,
                                  nationality,
                                  workId);

                              if (data == true) {
                                homeScreenController.getData();
                                Get.back();
                                Get.back();
                                print("Post Successfully");
                              } else {
                                print("Post Failed");
                              }
                            },
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
