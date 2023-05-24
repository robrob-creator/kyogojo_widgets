import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:routemaster/routemaster.dart';

class SecondaryNavigationBar extends HookWidget with PreferredSizeWidget {
  const SecondaryNavigationBar({Key? key, this.title, this.actions})
      : super(key: key);

  final String? title;
  final Widget? actions;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final router = Routemaster.of(context);
    //useEffect(() {}, []);

    var navigator = AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Text(title ?? "",
          style: const TextStyle(
            color: Color(0xff50555c),
            fontSize: 16,
          )),
      centerTitle: true,
      foregroundColor: DesignSystem.foundation.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (() {
          HapticFeedback.mediumImpact();
          router.history.back();
        }),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: actions)
      ],
    );
    return navigator;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
