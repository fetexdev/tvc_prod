import 'package:flutter/material.dart';
import 'package:the_vaping_app/const/strings.dart';
import 'package:the_vaping_app/utils/page_navigator.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/view/promo/promo.dart';
import 'package:the_vaping_app/view/shop/shop.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  static const List<String> fieldTitles = [
    AppStrings.tabFieldOne,
    AppStrings.tabFieldTwo,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      color: Colors.transparent,
      width: Sizer().width,
      height: kToolbarHeight,
      child: Row(
        children: List.generate(
          2,
          (index) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (index == 0) {
                    PageNavigator.goTo(context, page: const PromoView());
                  } else {
                    PageNavigator.goTo(context, page: const ShopView());
                  }
                },
                child: Row(
                  children: [
                    FittedBox(
                      child: TextWidget(
                        text: fieldTitles[index],
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Icon(Icons.arrow_drop_down,
                        color: Colors.white, size: 16.sp)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
