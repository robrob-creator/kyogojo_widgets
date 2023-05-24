import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

class AutocompleteField extends HookWidget {
  const AutocompleteField(
      {Key? key,
      this.hintText,
      this.required = false,
      required this.options,
      this.loading = false,
      this.placeholder,
      this.label,
      this.onSelected,
      this.onChanged,
      this.initialValue,
      this.onEditingComplete,
      this.value})
      : super(key: key);

  final String? hintText;
  final bool? required;
  final String? value;
  final List<String> options;
  final String? placeholder;
  final String? label;
  final bool? loading;
  final TextEditingValue? initialValue;
  final Function(String)? onSelected;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    var field = Container(
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFFEEEEEE), width: 1.5.w),
          borderRadius: BorderRadius.circular(6.r)),
      child: loading == true
          ? ConstrainedBox(
              constraints: const BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 300), //RELEVANT CHANGE: added maxWidth
              child: JumpingDots(
                color: DesignSystem.foundation.primaryBackgroundD,
                radius: 6,
                numberOfDots: 3,
                animationDuration: const Duration(milliseconds: 300),
              ))
          : Autocomplete<String>(
              onSelected: onSelected,
              initialValue: initialValue,
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }

                return options.where((String option) {
                  return option
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase());
                });
              },
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                          maxHeight: 500,
                          maxWidth: 300), //RELEVANT CHANGE: added maxWidth
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return InkWell(
                            onTap: () {
                              onSelected(option);
                            },
                            child: Builder(builder: (BuildContext context) {
                              final bool highlight =
                                  AutocompleteHighlightedOption.of(context) ==
                                      index;
                              if (highlight) {
                                SchedulerBinding.instance
                                    .addPostFrameCallback((Duration timeStamp) {
                                  Scrollable.ensureVisible(context,
                                      alignment: 0.5);
                                });
                              }
                              return Container(
                                color: highlight
                                    ? Theme.of(context).focusColor
                                    : null,
                                padding: const EdgeInsets.all(16.0),
                                child: Text(option),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              fieldViewBuilder: (BuildContext context,
                  TextEditingController fieldTextEditingController,
                  FocusNode fieldFocusNode,
                  VoidCallback onFieldSubmitted) {
                return TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: placeholder,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 14),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                            color: const Color(0XFF6E7191))),
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    onChanged: onChanged,
                    onEditingComplete: onEditingComplete,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: const Color(0XFF6E7191)));
              },
            ),
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
          field,
        ],
      ),
    );
  }
}
