import 'package:flutter/material.dart';
import 'package:invoice_tracker_main_app/controllers/home_page_controller.dart';
import 'widgets/widget_items.dart';

///page controller
HomePageController homeScreenController = HomePageController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    homeScreenController.getData();
    homeScreenController.isLoading(true);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        homeScreenController.isLoading(false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            WidgetItems(),
          ],
        ),
      ),
    );
  }
}



  // ListView widgetListLoadingItems() {
  //   return ListView.builder(
  //     itemCount: 5,
  //     physics: const BouncingScrollPhysics(),
  //     itemBuilder: (context, index) => Padding(
  //       padding: EdgeInsets.only(
  //         left: 10.w,
  //         right: 10.w,
  //         top: 10.h,
  //       ),
  //       child: const CustomLoadingContainer(),
  //     ),
  //   );
  // }

 