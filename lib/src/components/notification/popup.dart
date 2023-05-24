import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/components/buttons/pill.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

class PopupNotification extends HookWidget {
  const PopupNotification({
    required this.title,
    required this.message,
    required this.primaryBtnOnPressed,
    required this.primaryBtnLabel,
    required this.onClose,
    Key? key,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final title;
  // ignore: prefer_typing_uninitialized_variables
  final message;
  final Function primaryBtnOnPressed;
  final String primaryBtnLabel;
  final Function onClose;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SafeArea(
      child: Builder(builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                height: 90.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0XFFF3F3F3)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: SizedBox(
                              width: 100.w,
                              height: 30.h,
                              child: PillButton(
                                  label: primaryBtnLabel,
                                  onPressed: primaryBtnOnPressed),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      onClose();
                    },
                    icon: Icon(
                      CupertinoIcons.multiply,
                      color: DesignSystem.foundation.darkgray,
                      size: 24,
                    )),
              ),
            ],
          ),
        );
      }),
    );
  }
}
