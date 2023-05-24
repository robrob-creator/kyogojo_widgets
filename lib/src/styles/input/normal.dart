import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum NormalInputType { light, dark }

class NormalInpt {
  static TextStyle textStyle(NormalInputType type) {
    TextStyle textStyle = TextStyle(fontSize: 15.sp);

    if (type == NormalInputType.light) {
      return textStyle.copyWith(color: DesignSystem.foundation.primaryContentA);
    }

    return textStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }

  static BorderSide borderSide(NormalInputType type) {
    BorderSide borderSide = const BorderSide();

    if (type == NormalInputType.light) {
      return borderSide.copyWith(
          color: DesignSystem.foundation.primaryContentA);
    }

    return borderSide.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }
}
