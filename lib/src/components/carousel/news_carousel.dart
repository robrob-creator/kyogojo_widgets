import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kyogojo_widgets/src/styles/design_system.dart';

class NewsCarousel extends HookWidget {
  const NewsCarousel({
    Key? key,
    this.numberOfPage = 5,
  }) : super(key: key);

  final int numberOfPage;

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController(
      viewportFraction: .90,
      initialPage: 0,
    );
//update the carousel
    var content = Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 2.5.h),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    'images/content_image.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Headline",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: DesignSystem.foundation.black),
                      text:
                          'Est ad fugiat elit fugiat proident ex incididunt mollit anim elit excepteur non adipisicing eiusmod. Et commodo amet commodo occaecat ea cupidatat non occaecat amet est occaecat enim ipsum non. Reprehenderit velit Lorem irure aliqua exercitation.')),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 32,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h),
                    child: Text("Read full",
                        style: TextStyle(
                            color: DesignSystem.foundation.secondaryContentA)),
                  )
                ],
              ),
            )
          ],
        ));

    var header = Padding(
      padding: EdgeInsets.fromLTRB(27.w, 25.h, 27.w, 0),
      child: Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              'images/bell.svg',
              fit: BoxFit.contain,
            ),
          ),
          const Text(
            ' News',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            'View All',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: DesignSystem.foundation.primaryBackgroundA),
          ),
        ],
      ),
    );

    var pageView = SizedBox(
      height: 500.h,
      child: Column(
        children: [
          SizedBox(
            child: header,
          ),
          SizedBox(
            height: 400.h,
            child: PageView(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              children: <Widget>[content, content, content],
            ),
          ),
        ],
      ),
    );

    return pageView;
  }
}
