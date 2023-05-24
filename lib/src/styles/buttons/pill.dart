import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum PillButtonType { light, dark }

enum PillButtonState { defaultx, pressed, disabled }

class PillBtn {
  static BoxDecoration boxDecortion(
    PillButtonType type,
    PillButtonState state,
  ) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(40.r),
      ),
    );

    if (type == PillButtonType.light) {
      return boxDecoration.copyWith(
        color: state == PillButtonState.defaultx
            ? DesignSystem.foundation.white
            : state == PillButtonState.pressed
                ? DesignSystem.foundation.primaryBackgroundB
                : DesignSystem.foundation.primaryBackgroundC,
      );
    }

    return boxDecoration.copyWith(
      color: state == PillButtonState.defaultx
          ? DesignSystem.foundation.primaryBackgroundA
          : state == PillButtonState.pressed
              ? DesignSystem.foundation.primaryBackgroundB
              : DesignSystem.foundation.primaryBackgroundC,
    );
  }

  static TextStyle textStyle(
    PillButtonType type,
    PillButtonState state,
  ) {
    TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp);

    if (type == PillButtonType.light) {
      return textStyle.copyWith(color: DesignSystem.foundation.primaryContentA);
    }

    return textStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }
}
