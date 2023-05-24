import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum RoundedButtonType { light, dark }

enum RoundedButtonState { defaultx, pressed, disabled }

class RoundedBtn {
  static BoxDecoration boxDecortion(
    RoundedButtonType type,
    RoundedButtonState state,
    Color? customColor,
    Color? focusColor,
  ) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(8.r),
      ),
    );

    if (customColor != null) {
      return boxDecoration.copyWith(
        color: state == RoundedButtonState.defaultx
            ? customColor
            : state == RoundedButtonState.pressed
                ? focusColor
                : DesignSystem.foundation.secondaryContentB,
      );
    }

    if (type == RoundedButtonType.light) {
      return boxDecoration.copyWith(
        color: state == RoundedButtonState.defaultx
            ? DesignSystem.foundation.white
            : state == RoundedButtonState.pressed
                ? DesignSystem.foundation.primaryBackgroundB
                : DesignSystem.foundation.primaryBackgroundC,
      );
    }

    return boxDecoration.copyWith(
      color: state == RoundedButtonState.defaultx
          ? DesignSystem.foundation.primaryBackgroundA
          : state == RoundedButtonState.pressed
              ? DesignSystem.foundation.primaryBackgroundB
              : DesignSystem.foundation.primaryBackgroundC,
    );
  }

  static TextStyle textStyle(
    RoundedButtonType type,
    RoundedButtonState state,
  ) {
    TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp);

    if (type == RoundedButtonType.light) {
      return textStyle.copyWith(color: DesignSystem.foundation.primaryContentA);
    }
    if (state == RoundedButtonState.disabled) {
      return textStyle.copyWith(
          color: DesignSystem.foundation.primaryBackgroundD.withOpacity(0.5));
    }
    return textStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }
}
