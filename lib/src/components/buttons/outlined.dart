import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/buttons/outlined.dart';

class OutlinedButtonRounded extends HookWidget {
  const OutlinedButtonRounded({
    Key? key,
    this.type = OutlinedButtonType.light,
    this.color = Colors.white,
    this.state = OutlinedButtonState.defaultx,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.size,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;
  final Color color;
  final OutlinedButtonType type;
  final OutlinedButtonState state;
  final OutlinedBtnSize? size;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    double getHeightBySize() {
      if (size == OutlinedBtnSize.lg) {
        return 200;
      }
      return 36.0;
    }

    double getWidthBySize() {
      if (size == OutlinedBtnSize.lg) {
        return 300;
      }
      return 88.0;
    }

    var button = Container(
        width: 100,
        alignment: Alignment.center,
        child: ButtonTheme(
          height: getHeightBySize(),
          minWidth: getWidthBySize(),
          child: OutlinedButton(
              onPressed: enabled
                  ? () {
                      onPressed();
                    }
                  : null,
              style: OutlinedBtn.btnStyle(
                  type, OutlinedButtonState.defaultx, color, enabled),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    visible: prefixIcon != null,
                    child: Icon(
                      prefixIcon,
                      color: enabled ? color : Colors.grey,
                    ),
                  ),
                  Text(label,
                      style:
                          OutlinedBtn.textStyle(color, type, state, enabled)),
                  Visibility(
                    visible: suffixIcon != null,
                    child: Icon(
                      suffixIcon,
                      color: enabled ? color : Colors.grey,
                    ),
                  ),
                ],
              )),
        ));

    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: color.withOpacity(.3),
        child: button,
      ),
    );
  }
}
