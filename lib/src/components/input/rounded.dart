import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/input/rounded.dart';

class RoundedInputValidation {
  String message;
  bool hasError;
  bool clean;
  RoundedInputValidation(this.message, this.hasError, this.clean);
}

class RoundedInput extends HookWidget {
  const RoundedInput({
    Key? key,
    this.enabled = true,
    this.hasError = false,
    this.obscure = false,
    this.errorMessage = "",
    this.type = RoundedInputType.normal,
    this.state = RoundedInputState.defaultx,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.isRequired = false,
    this.showClearBtn = true,
    required this.controller,
    required this.label,
  }) : super(key: key);

  final String label;
  final bool enabled;
  final bool hasError;
  final String errorMessage;
  final bool obscure;
  final RoundedInputType type;
  final RoundedInputState state;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool? isRequired;
  final bool? showClearBtn;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final showPassword = useState(false);
    final showClearInputBtn = useState(false);
    final focusNode = useFocusNode();
    final toggle = useState(false);

    useEffect(() {
      focusNode.addListener(() {
        if (controller.text.trim().isEmpty) {
          toggle.value = false;
        }
        if (controller.text.trim().isNotEmpty) {
          toggle.value = true;
        }
        if (focusNode.hasFocus) {
          toggle.value = true;
        }
      });

      return; // You need this return if you have missing_return lint
    }, [focusNode, controller.value]);

    void handleShowPassword() {
      showPassword.value = !showPassword.value;
    }

    void clearInput() {
      controller.clear();
      showClearInputBtn.value = !showClearInputBtn.value;
    }

    controller.addListener(() {});
    var suffixIcon = type == RoundedInputType.normal
        ? Visibility(
            visible: showClearInputBtn.value && showClearBtn!,
            child: IconButton(
                onPressed: clearInput,
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                )),
          )
        : IconButton(
            onPressed: handleShowPassword,
            icon: showPassword.value
                ? const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  )
                : const Icon(
                    CupertinoIcons.eye_slash,
                    color: Colors.black,
                  ));

    var labelWidget = RichText(
        text: TextSpan(
            text: label,
            style: RoundedInputX.labelTextStyle(state),
            children: [
          if (isRequired!)
            const TextSpan(text: '*', style: TextStyle(color: Colors.red))
        ]));
    var hasClearIcon = showClearBtn;
    var textfield = Container(
      decoration: RoundedInputX.boxDecoration(state),
      child: Stack(
        children: [
          TextField(
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: const Color(0XFF6E7191)),
              keyboardType: keyboardType,
              maxLines: 1,
              autocorrect: false,
              textAlignVertical: TextAlignVertical.bottom,
              focusNode: focusNode,
              onChanged: ((value) =>
                  showClearInputBtn.value = (value.isNotEmpty)),
              obscureText: type == RoundedInputType.normal
                  ? false
                  : showPassword.value
                      ? true
                      : false,
              controller: controller,
              decoration: RoundedInputX.inputDecoration(
                  state,
                  labelWidget,
                  clearInput,
                  handleShowPassword,
                  type,
                  suffix,
                  prefix,
                  showPassword,
                  suffixIcon,
                  hasError,
                  errorMessage,
                  hasClearIcon)),
          Visibility(
            visible: toggle.value,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 8.0, 0, 0),
              child: RichText(
                  text: TextSpan(
                      text: label,
                      style: TextStyle(
                          color: const Color(0Xff6E7191),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                      children: [
                    if (isRequired!)
                      const TextSpan(
                          text: ' *', style: TextStyle(color: Colors.red))
                  ])),
            ),
          ),
        ],
      ),
    );

    return Material(color: Colors.transparent, child: textfield);
  }
}
