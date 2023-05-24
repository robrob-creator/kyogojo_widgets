import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:kyogojo_widgets/src/components/buttons/outlined.dart';
import 'package:kyogojo_widgets/src/components/buttons/pill.dart';
import 'package:kyogojo_widgets/src/components/buttons/timer.dart';
import 'package:kyogojo_widgets/src/styles/buttons/outlined.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:permission_handler/permission_handler.dart';

class ModalService {
  static void showErrorBottomSheet(String errMsg, BuildContext modalContext) {
    showModalBottomSheet(
        context: modalContext,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.sp, vertical: 21.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF979797))),
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp),
                    child: Text(errMsg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF4E4B66),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: OutlinedButtonRounded(
                        size: OutlinedBtnSize.lg,
                        color: const Color(0XFF50555C),
                        label: 'Got it',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showErrorHandlerBottomSheet(
      String errMsg, Function onChange, BuildContext modalContext) {
    showModalBottomSheet(
        context: modalContext,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.sp, vertical: 21.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF979797))),
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp),
                    child: Text(errMsg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF4E4B66),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: OutlinedButtonRounded(
                        size: OutlinedBtnSize.lg,
                        color: const Color(0XFF50555C),
                        label: 'Got it',
                        onPressed: () {
                          onChange();
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showWithTimeoutBottomSheet(
      String errMsg, BuildContext modalContext) {
    showModalBottomSheet(
        context: modalContext,
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.sp, vertical: 21.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Something went wrong ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: const Color(0XFF979797))),
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp),
                    child: Text(errMsg,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF4E4B66),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: OutlinedButtonTimer(
                        label: "Close",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        onFinish: () => Navigator.pop(context),
                        duration: 3),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showSuccessBottomSheet(
      String title,
      String message,
      BuildContext modalContext,
      String actionButtonTitle,
      Function() primaryAction) {
    showModalBottomSheet(
        context: modalContext,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                topLeft: Radius.circular(24.r))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 56.sp, vertical: 21.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      key: const Key("txtWelcomeTitle"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 36.sp,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                          color: DesignSystem.foundation.primaryBackgroundA)),
                  Padding(
                    padding: EdgeInsets.only(top: 20.sp),
                    child: Text(message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          letterSpacing: 0.75,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF4E4B66),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30.h),
                    child: PillButton(
                        key: const Key("btnAction"),
                        label: actionButtonTitle,
                        onPressed: () {
                          primaryAction();
                          Navigator.pop(context);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static void showLoading(BuildContext modalContext) {
    Loader.show(
      modalContext,
      isSafeAreaOverlay: false,
      progressIndicator: JumpingDots(
        color: DesignSystem.foundation.primaryBackgroundA,
        radius: 12,
        numberOfDots: 3,
        animationDuration: const Duration(milliseconds: 300),
      ),
      themeData: Theme.of(modalContext).copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.black38)),
      overlayColor: DesignSystem.foundation.black.withOpacity(.4),
    );
  }

  static Future<void> openAppSettingsDialog(
      {required BuildContext modalContext}) async {
    return showDialog<void>(
      context: modalContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Storage permission is required.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                    'Kyogojo app wants to access your storage and it needs your permission.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Go to app settings',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                openAppSettings();

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
