import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

enum BorderedInputState { defaultx }

enum BorderedInputType { password, normal }

class BorderedInputX {
  static BoxDecoration boxDecoration(
    BorderedInputState state,
  ) {
    BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6),
    );
    return boxDecoration;
  }

  static InputDecoration inputDecoration(
      BorderedInputState state,
      Widget label,
      Function clearInput,
      Function handleshowPassword,
      BorderedInputType type,
      Widget? suffix,
      Widget? prefix,
      final showPassword,
      StatelessWidget suffixIcon,
      bool hasError,
      Widget? customSuffix,
      String errorMessage,
      bool? hasClearIcon,
      Widget? prefixIcon,
      Color? focusColor) {
    InputDecoration inputDecoration = InputDecoration(
        errorText: hasError ? errorMessage : null,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFEEEEEE), width: 1.5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFEEEEEE), width: 1.5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: const Color(0XFFEEEEEE), width: 1.5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: focusColor ?? DesignSystem.foundation.primaryBackgroundA,
              width: 1.5.w),
          borderRadius: BorderRadius.circular(6.r),
        ),
        fillColor: Colors.transparent,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: customSuffix ?? (hasClearIcon! ? suffixIcon : null),
        suffix: suffix,
        prefix: prefix,
        prefixIcon: prefixIcon,
        label: label,
        labelStyle: TextStyle(
            fontSize: 12.sp, color: Colors.grey, fontWeight: FontWeight.w400));

    return inputDecoration;
  }

  static InputDecoration dateInputDecoration() {
    InputDecoration inputDecoration = InputDecoration(
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
        labelStyle: TextStyle(
            fontSize: 15.sp, color: Colors.grey, fontWeight: FontWeight.w500));

    return inputDecoration;
  }

  static TextStyle textStyle(
    BorderedInputState state,
  ) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        color: const Color(0XFF14142B));

    return textStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }

  static TextStyle labelTextStyle(
    BorderedInputState state,
  ) {
    TextStyle textStyle = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 14.sp, letterSpacing: .25);

    return textStyle.copyWith(
        color: DesignSystem.foundation.primaryBackgroundD);
  }
}
