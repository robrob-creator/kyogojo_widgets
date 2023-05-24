import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../design_system.dart';

enum OTPFieldType { dark, light }

class OTPFieldX {
  static TextStyle otpTextStyle(
    OTPFieldType type,
  ) {
    TextStyle otpTextStyle =
        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600);

    if (type == OTPFieldType.light) {
      return otpTextStyle.copyWith(
          color: DesignSystem.foundation.primaryContentA);
    }

    return otpTextStyle.copyWith(
        color: DesignSystem.foundation.secondaryBackgroundA);
  }
}
