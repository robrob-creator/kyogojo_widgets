import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:kyogojo_widgets/src/styles/input/otp.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField2 extends HookWidget {
  const OTPField2({
    Key? key,
    this.type = OTPFieldType.light,
    required this.onSubmit,
    required this.controller,
    this.errorMessage,
  }) : super(key: key);

  final OTPFieldType type;
  final Function(String) onSubmit;
  final TextEditingController controller;
  final String? errorMessage;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: OTPFieldX.otpTextStyle(type),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: DesignSystem.foundation.primaryBackgroundA),
        // color: const Color(0XFFEFF0F7),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
    var otpField = Pinput(
      validator: (pin) {
        if (pin!.isEmpty) {
          return 'Invalid pin code!';
        }
        return null;
      },
      autofocus: true,
      defaultPinTheme: defaultPinTheme,
      onCompleted: ((value) => onSubmit(value)),
      errorText: errorMessage ?? '',
    );
    return otpField;
  }
}
