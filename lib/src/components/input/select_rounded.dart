import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:kyogojo_widgets/src/styles/input/bordered.dart';

class RoundedSelect extends HookWidget {
  const RoundedSelect(
      {Key? key,
      required this.list,
      this.hintText,
      this.required = false,
      required this.onChanged,
      this.hasError = false,
      this.errorMessage = "",
      this.label,
      this.value})
      : super(key: key);

  final List<String> list;
  final String? hintText;
  final bool? required;
  final bool hasError;
  final String errorMessage;
  final String? value;
  final String? label;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var textField = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFFEEEEEE), width: 1.5.w),
              borderRadius: BorderRadius.circular(6.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<String>(
                focusNode: null,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                underline: Container(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(12.sp),
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        hintText != null ? hintText! : '',
                        style: BorderedInputX.labelTextStyle(
                            BorderedInputState.defaultx),
                      ),
                      Text("*",
                          style: TextStyle(
                              color: required! == true
                                  ? Colors.red
                                  : Colors.transparent)),
                    ],
                  ),
                ),
                value: value,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0XFF6E7191)),
                onChanged: onChanged,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text(
                        value,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                errorMessage,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DesignSystem.foundation.primaryBackgroundB),
              ),
            ),
          )
      ],
    );
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: RichText(
                    text: TextSpan(
                        text: label,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 45, 55, 72)),
                        children: [
                      if (required!)
                        const TextSpan(
                            text: '*', style: TextStyle(color: Colors.red))
                    ]))),
          textField,
        ],
      ),
    );
  }
}

class RoundedMapSelect extends HookWidget {
  const RoundedMapSelect(
      {Key? key,
      required this.list,
      this.hintText,
      this.required = false,
      this.onChanged,
      this.hasError = false,
      this.errorMessage = "",
      required this.listElementAsLabel,
      this.label,
      this.value})
      : super(key: key);

  final List<dynamic> list;
  final String? hintText;
  final bool? required;
  final bool hasError;
  final String errorMessage;
  final String listElementAsLabel;
  final Map<String, dynamic>? value;
  final String? label;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var textField = Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFFEEEEEE), width: 1.5.w),
              borderRadius: BorderRadius.circular(6.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropdownButton<dynamic>(
                focusNode: null,
                icon: const Icon(Icons.expand_more),
                elevation: 16,
                underline: Container(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(12.sp),
                isExpanded: true,
                hint: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        hintText != null ? hintText! : '',
                        style: BorderedInputX.labelTextStyle(
                            BorderedInputState.defaultx),
                      ),
                      Text("*",
                          style: TextStyle(
                              color: required! == true
                                  ? Colors.red
                                  : Colors.transparent)),
                    ],
                  ),
                ),
                value: value,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: const Color(0XFF6E7191)),
                onChanged: onChanged,
                items: list.map((map) {
                  return DropdownMenuItem<dynamic>(
                    value: map,
                    child: Text(map[listElementAsLabel]),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                errorMessage,
                style: TextStyle(
                    fontSize: 12.sp,
                    color: DesignSystem.foundation.primaryBackgroundB),
              ),
            ),
          )
      ],
    );

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: RichText(
                    text: TextSpan(
                        text: label,
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 45, 55, 72)),
                        children: [
                      if (required!)
                        const TextSpan(
                            text: '*', style: TextStyle(color: Colors.red))
                    ]))),
          textField,
        ],
      ),
    );
  }
}
