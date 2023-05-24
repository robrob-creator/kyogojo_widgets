import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum RoundedInputState { defaultx }

enum RoundedInputType { password, normal }

class RoundedInputX {
  static BoxDecoration boxDecoration(
    RoundedInputState state,
  ) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
    );
    return boxDecoration;
  }

  static InputDecoration inputDecoration(
      RoundedInputState state,
      Widget label,
      Function clearInput,
      Function handleshowPassword,
      RoundedInputType type,
      Widget? suffix,
      Widget? prefix,
      final showPassword,
      StatelessWidget suffixIcon,
      bool hasError,
      String errorMessage,
      bool? hasClearIcon) {
    InputDecoration inputDecoration = InputDecoration(
        errorText: hasError ? errorMessage : null,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: DesignSystem.foundation.secondaryContentA, width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: DesignSystem.foundation.secondaryContentA, width: 2.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        fillColor: const Color(0XFFEFF0F7),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: hasClearIcon! ? suffixIcon : null,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: suffix,
        ),
        prefix: prefix,
        label: label,
        labelStyle: TextStyle(
            fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w400));

    return inputDecoration;
  }

  static TextStyle textStyle(
    RoundedInputState state,
  ) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        color: const Color(0XFF14142B));

    return textStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }

  static TextStyle labelTextStyle(
    RoundedInputState state,
  ) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w500, fontSize: 14.sp, letterSpacing: .25);

    return textStyle.copyWith(
        color: DesignSystem.foundation.primaryBackgroundD);
  }
}
