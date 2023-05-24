import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/buttons/rounded.dart';
import 'dart:developer' as dev;

class RoundedButton extends HookWidget {
  const RoundedButton(
      {Key? key,
      this.loading = false,
      this.state = RoundedButtonState.defaultx,
      this.hasError = false,
      this.type = RoundedButtonType.dark,
      required this.label,
      required this.onPressed,
      this.icon,
      this.iconColor,
      this.customColor,
      this.focusColor,
      this.labelStyle,
      this.disabled = false})
      : super(key: key);

  final Color? customColor;
  final Color? focusColor;
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final bool loading;
  final RoundedButtonState state;
  final bool hasError;
  final Function onPressed;
  final RoundedButtonType type;
  final bool? disabled;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var triggerState = useState(state);

    useEffect(() {
      if (state == RoundedButtonState.disabled) {
        triggerState.value = RoundedButtonState.disabled;
      }
      triggerState.value = state;
      dev.log(triggerState.value.toString());
      return;
    }, [state]);

    var button = Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 56.h,
      decoration: RoundedBtn.boxDecortion(
          type, triggerState.value, customColor, focusColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: iconColor,
            ),
          Text(
            loading ? "Please wait..." : label,
            style: labelStyle ?? RoundedBtn.textStyle(type, triggerState.value),
          ),
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8.r),
        onTap: () =>
            triggerState.value == RoundedButtonState.disabled || loading
                ? () => {}
                : onPressed(),
        onLongPress: () {},
        onTapDown: (_) {
          if (triggerState.value == RoundedButtonState.disabled) return;
          triggerState.value = RoundedButtonState.pressed;
        },
        onHover: (_) {
          if (triggerState.value == RoundedButtonState.disabled) return;
        },
        onFocusChange: (_) {
          if (triggerState.value == RoundedButtonState.disabled) return;
        },
        onDoubleTap: () {
          if (triggerState.value == RoundedButtonState.disabled) return;
          triggerState.value = RoundedButtonState.pressed;
        },
        onHighlightChanged: (_) {
          if (triggerState.value == RoundedButtonState.disabled) return;
        },
        onTapUp: (_) {
          if (triggerState.value == RoundedButtonState.disabled) return;
          triggerState.value = RoundedButtonState.defaultx;
        },
        onTapCancel: () {
          if (triggerState.value == RoundedButtonState.disabled) return;
          triggerState.value = RoundedButtonState.defaultx;
        },
        child: button,
      ),
    );
  }
}
