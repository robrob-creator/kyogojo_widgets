import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends HookWidget {
  const CarouselSlider(
      {Key? key,
      required this.controller,
      this.title,
      this.subtitle,
      this.height = 211,
      required this.children})
      : super(key: key);

  final PageController controller;
  final String? title;
  final String? subtitle;
  final List<Widget> children;
  final double? height;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    Future autoPlay() async {
      var limit = children.length;
      var count = 0;
      var forward = true;

      for (int i = 0; i < limit; forward == false ? i-- : i++) {
        await Future.delayed(const Duration(seconds: 3), () {
          if (controller.hasClients) {
            controller.animateToPage(i,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          }
        });

        if (count == children.length - 1) {
          forward = forward == false ? true : false;
          count = 1;
        } else {
          count++;
        }
      }
    }

    useEffect(() {
      Future.microtask(() => {
            if (children.length > 1) {autoPlay()}
          });
      return;
    }, [controller]);

    var slider = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: height,
          child: PageView(
              scrollDirection: Axis.horizontal,
              controller: controller,
              children: children),
        ),
        if (title != null)
          Text(
            title!,
            style: TextStyle(
                fontSize: 20,
                color: DesignSystem.foundation.white,
                fontWeight: FontWeight.w600),
          ),
        if (subtitle != null)
          SizedBox(
            height: 5.h,
          ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
                fontSize: 14,
                color: DesignSystem.foundation.white,
                fontWeight: FontWeight.w400),
          ),
        if (subtitle != null)
          SizedBox(
            height: 29.h,
          ),
        SmoothPageIndicator(
          controller: controller,
          count: children.length,
          onDotClicked: (index) {
            controller.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
          effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: DesignSystem.foundation.primaryBackgroundB,
              activeDotColor: DesignSystem.foundation.primaryBackgroundB),
        )
      ],
    );

    return Material(
      color: Colors.transparent,
      child: slider,
    );
  }
}

class CarouselSlide extends HookWidget {
  const CarouselSlide({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 15),
      child: ClipRRect(borderRadius: BorderRadius.circular(20), child: content),
    );
  }
}
