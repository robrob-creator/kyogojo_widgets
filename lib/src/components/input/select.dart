import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:kyogojo_widgets/src/styles/input/normal.dart';

class NormalSelect extends HookWidget {
  const NormalSelect(
      {Key? key,
      required this.list,
      this.hintText,
      this.required = false,
      required this.onChanged,
      this.value})
      : super(key: key);

  final List<String> list;
  final String? hintText;
  final bool? required;
  final String? value;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    //useEffect(() {}, []);

    var textField = DropdownButton<String>(
      icon: const Icon(Icons.expand_more),
      elevation: 16,
      isExpanded: true,
      hint: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(hintText != null ? hintText! : ''),
            Text("*",
                style: TextStyle(
                    color: required! == true ? Colors.red : Colors.white)),
          ],
        ),
      ),
      value: value,
      style: NormalInpt.textStyle(NormalInputType.light),
      underline: Container(
        height: 1,
        color: DesignSystem.foundation.primaryContentA,
      ),
      onChanged: onChanged,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(value),
          ),
        );
      }).toList(),
    );
    return Material(
      color: Colors.transparent,
      child: textField,
    );
  }
}
