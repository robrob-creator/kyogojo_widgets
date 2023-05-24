import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navigation extends HookWidget {
  const Navigation({Key? key, this.left, this.middle, this.right})
      : super(key: key);

  final Widget? left;
  final Widget? middle;
  final Widget? right;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    //useEffect(() {}, []);

    var navigator = Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * 0.25,
              child: left,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.25,
              child: middle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width * 0.25,
              child: right,
            ),
          ),
        ],
      ),
    );
    return Material(
      color: Colors.white,
      child: navigator,
    );
  }
}
