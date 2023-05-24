import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/kyogojo_widgets.dart';

class PrimaryBottomNavigator extends HookWidget {
  const PrimaryBottomNavigator({Key? key, this.buttonLabel, this.onPressed})
      : super(key: key);

  final String? buttonLabel;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    var navigator = Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(25.w, 16.h, 25.w, 25.h),
        child: RoundedButton(
            label: buttonLabel ?? "", onPressed: onPressed ?? () {}),
      ),
    );
    return navigator;
  }
}
