import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/kyogojo_widgets.dart';

class BorderedInputValidation {
  String message;
  bool hasError;
  bool clean;
  BorderedInputValidation(this.message, this.hasError, this.clean);
}

class BorderedInput extends HookWidget {
  const BorderedInput(
      {Key? key,
      this.enabled = true,
      this.hasError = false,
      this.obscure = false,
      this.placeholder,
      this.errorMessage = "",
      this.type = BorderedInputType.normal,
      this.state = BorderedInputState.defaultx,
      this.prefix,
      this.suffix,
      this.keyboardType,
      this.isRequired = false,
      this.showClearBtn = true,
      this.maxChar,
      this.showCursor,
      this.numOnly = false,
      this.dateFormatter = false,
      this.customSuffix,
      required this.controller,
      this.label,
      this.prefixIcon,
      this.onTap,
      this.inputFormatters,
      required this.onChanged,
      this.readOnly,
      this.focusColor})
      : super(key: key);

  final String? label;
  final String? placeholder;
  final bool enabled;
  final bool hasError;
  final String errorMessage;
  final bool obscure;
  final BorderedInputType type;
  final BorderedInputState state;
  final TextEditingController controller;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? isRequired;
  final bool? showClearBtn;
  final Widget? customSuffix;
  final int? maxChar;
  final bool? showCursor;
  final bool? numOnly;
  final bool? dateFormatter;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Color? focusColor;
  // ignore: no_leading_underscores_for_local_identifiers
  final Function(String s) onChanged;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final showPassword = useState(false);
    final showClearInputBtn = useState(false);
    final focusNode = useFocusNode();

    void handleShowPassword() {
      showPassword.value = !showPassword.value;
    }

    void clearInput() {
      controller.clear();
      showClearInputBtn.value = !showClearInputBtn.value;
    }

    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        showClearInputBtn.value = true;
      }
    });

    var suffixIcon = type == BorderedInputType.normal
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
                    CupertinoIcons.eye_slash,
                    color: Colors.black,
                  )
                : const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ));

    var labelWidget = RichText(
        text: TextSpan(
      text: placeholder,
      style: BorderedInputX.labelTextStyle(state),
    ));
    var hasClearIcon = showClearBtn;
    var textfield = Container(
      decoration: BorderedInputX.boxDecoration(state),
      child: Stack(
        children: [
          TextFormField(
              inputFormatters: dateFormatter!
                  ? [
                      FilteringTextInputFormatter.allow(RegExp(r'^[0-9-]+$')),
                      MultiMaskedTextInputFormatter(
                          masks: ['xx-xx-xxxx'], separator: '-'),
                      LengthLimitingTextInputFormatter(maxChar),
                    ]
                  : inputFormatters ?? [],
              enabled: enabled,
              onTap: onTap,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: const Color(0XFF6E7191)),
              keyboardType: keyboardType,
              maxLines: 1,
              autocorrect: false,
              focusNode: focusNode,
              showCursor: showCursor,
              onChanged: (value) => onChanged(value),
              obscureText: type == BorderedInputType.normal
                  ? false
                  : showPassword.value
                      ? false
                      : true,
              controller: controller,
              decoration: BorderedInputX.inputDecoration(
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
                  customSuffix,
                  errorMessage,
                  hasClearIcon,
                  prefixIcon,
                  focusColor)),
        ],
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
                        if (isRequired!)
                          const TextSpan(
                              text: '*', style: TextStyle(color: Colors.red))
                      ]))),
            textfield,
          ],
        ));
  }
}

class MultiMaskedTextInputFormatter extends TextInputFormatter {
  late List<String> _masks;
  late String _separator;
  String? _prevMask;

  MultiMaskedTextInputFormatter(
      {required List<String> masks, required String separator}) {
    _separator = (separator.isNotEmpty) ? separator : '';

    if (masks.isNotEmpty) {
      _masks = masks;
      _masks.sort((l, r) => l.length.compareTo(r.length));
      _prevMask = masks[0];
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final oldText = oldValue.text;

    if (newText.isEmpty || newText.length < oldText.length) {
      return newValue;
    }

    final pasted = (newText.length - oldText.length).abs() > 1;
    final mask = _masks.firstWhere((value) {
      final maskValue = pasted ? value.replaceAll(_separator, '') : value;
      return newText.length <= maskValue.length;
    }, orElse: () => '');

    if (mask.isEmpty) {
      return oldValue;
    }

    final needReset =
        (_prevMask != mask || newText.length - oldText.length > 1);
    _prevMask = mask;

    if (needReset) {
      final text = newText.replaceAll(_separator, '');
      String resetValue = '';
      int sep = 0;

      for (int i = 0; i < text.length; i++) {
        if (mask[i + sep] == _separator) {
          resetValue += _separator;
          ++sep;
        }
        resetValue += text[i];
      }

      return TextEditingValue(
        text: resetValue,
        selection: TextSelection.collapsed(offset: resetValue.length),
      );
    }

    if (newText.length < mask.length &&
        mask[newText.length - 1] == _separator) {
      final text =
          '$oldText$_separator${newText.substring(newText.length - 1)}';
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    return newValue;
  }
}
