import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

class OutlinedButtonTimer extends HookWidget {
  const OutlinedButtonTimer({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.duration,
    required this.onFinish,
  }) : super(key: key);

  final String label;
  final Function onPressed;
  final int duration;
  final Function onFinish;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final timeLeft = useState(duration);

    void timer() async {
      await Future.doWhile(() async {
        await Future.delayed(const Duration(seconds: 1));
        if (timeLeft.value == 0) {
          onFinish();
          return false;
        }
        timeLeft.value--;
        return true;
      });
    }

    useEffect(() {
      timer();

      return () {
        timeLeft.dispose();
      };
    }, []);

    var button = OutlinedButton(
      style: ButtonStyle(
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
            return BorderSide(
              width: 1.5,
              color: timeLeft.value == 0
                  ? DesignSystem.foundation.primaryBackgroundA
                  : Colors.grey,
            );
          },
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (Set<MaterialState> states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r),
            );
          },
        ),
      ),
      onPressed: () {
        timeLeft.value > 0 ? null : onPressed();
      },
      child: Text(
        '$label ${timeLeft.value > 0 ? '| in ${timeLeft.value}' : ' '}${timeLeft.value > 0 ? 's' : ''}',
        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: DesignSystem.foundation.primaryBackgroundA.withOpacity(.3),
        child: button,
      ),
    );
  }
}
