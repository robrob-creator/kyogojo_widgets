import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/buttons/pill.dart';

class PillButton extends HookWidget {
  const PillButton({
    Key? key,
    this.loading = false,
    this.state = PillButtonState.defaultx,
    this.hasError = false,
    this.type = PillButtonType.dark,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool loading;
  final PillButtonState state;
  final bool hasError;
  final Function onPressed;
  final PillButtonType type;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    var triggerState = useState(state);
    var disabled = useState(false);
    useEffect(() {
      disabled.value = state == PillButtonState.disabled;
      if (disabled.value) triggerState.value = PillButtonState.disabled;
      return;
    }, []);

    var button = Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 56.h,
      decoration: PillBtn.boxDecortion(type, triggerState.value),
      child: Text(
        label,
        style: PillBtn.textStyle(type, triggerState.value),
      ),
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => disabled.value || loading ? () => {} : onPressed(),
        onTapDown: (_) {
          if (disabled.value) return;
          triggerState.value = PillButtonState.pressed;
        },
        onTapUp: (_) {
          if (disabled.value) return;
          triggerState.value = PillButtonState.defaultx;
        },
        child: button,
      ),
    );
  }
}
