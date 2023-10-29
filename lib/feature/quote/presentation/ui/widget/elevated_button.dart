import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerElevatedButton extends StatelessWidget {
  const CustomerElevatedButton({super.key, this.color,
    this.fixedSize, this.padding, this.onPressed, this.widget, this.shape});
  final Color?color;
  final Size?fixedSize;
  final EdgeInsets?padding;
  final VoidCallback?onPressed;
  final Widget ?widget;
  final OutlinedBorder? shape;

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: padding!,
      child: ElevatedButton(onPressed:onPressed, child:widget,

          style: ElevatedButton.styleFrom(
              backgroundColor:color,
              elevation: 0,
              fixedSize: fixedSize,
            shape:shape
          )),
    );
  }
}
