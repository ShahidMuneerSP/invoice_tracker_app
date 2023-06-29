import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

///this is the loading container in home screen
class CustomLoadingContainer extends StatefulWidget {
  const CustomLoadingContainer({Key? key}) : super(key: key);

  @override
  State<CustomLoadingContainer> createState() => _CustomLoadingContainerState();
}

class _CustomLoadingContainerState extends State<CustomLoadingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.all(10.r),
      width: double.infinity,
      child: Column(
        children: [
          ///1
          SizedBox(
            height: 5.w,
          ),
          Row(
            children: [
              Expanded(child: Skelton(height: 20)),
              SizedBox(
                width: 40.w,
              ),
              Skelton(width: 70, height: 20),
            ],
          ),

          ///2
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(child: Skelton(height: 20)),
              SizedBox(
                width: 70.w,
              ),
            ],
          ),

          ///3
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(child: Skelton(height: 20)),
              SizedBox(
                width: 130.w,
              ),
            ],
          ),

          ///4
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(child: Skelton(height: 20)),
              SizedBox(
                width: 120.w,
              ),
            ],
          ),

          ///5
          SizedBox(
            height: 10.w,
          ),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Skelton(
                  height: 20,
                ),
              ),
              SizedBox(
                width: 40.w,
              ),
              Expanded(
                flex: 8,
                child: Skelton(
                  height: 20,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                flex: 5,
                child: Skelton(
                  height: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
        ],
      ),
    );
  }
}

class Skelton extends StatelessWidget {
  Skelton({this.height = 0, this.width = 0});
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.black.withOpacity(0.5),
      child: Container(
        height: height == 0 ? null : height,
        width: width == 0 ? null : width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.black.withOpacity(0.04),
        ),
      ),
    );
  }
}
