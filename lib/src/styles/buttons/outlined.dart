
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum OutlinedButtonType { light, dark }

enum OutlinedBtnSize { sm, md, lg }

enum OutlinedButtonState { defaultx, pressed, disabled }

class OutlinedBtn {
  static ButtonStyle btnStyle(OutlinedButtonType type,
      OutlinedButtonState state, Color color, bool enabled) {
    ButtonStyle style =
        ButtonStyle(side: MaterialStateProperty.resolveWith<BorderSide?>(
      (Set<MaterialState> states) {
        return BorderSide(
          width: 1.5,
          color: enabled ? color : Colors.grey,
        ); // Use the component's default.
      },
    ), shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
      (Set<MaterialState> states) {
        return RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(32.r)); // Use the component's default.
      },
    ));

    return style;
  }

  static TextStyle textStyle(Color? color, OutlinedButtonType type,
      OutlinedButtonState state, bool enabled) {
    TextStyle textStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 12.sp);
    if (!enabled) {
      return textStyle.copyWith(color: Colors.grey);
    }
    return textStyle.copyWith(color: color);
  }
}
