import 'package:flutter/material.dart';
import 'package:the_vaping_app/const/strings.dart';
import 'package:the_vaping_app/utils/page_navigator.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

class PromoView extends StatelessWidget {
  const PromoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left:8),
          onPressed: () => PageNavigator.pop(context),
          icon: const Icon(Icons.close, color: Colors.white, size: 32),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal:2.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(top: 2.w),
                color: Colors.amber,
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 2.w),
                color: Colors.amber,
              ),
            ),
            TextWidget(
              text: AppStrings.ourPartners,
              fontSize: 20.sp,
              fontFamily: "Impact",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            Container(
              width: Sizer().width,
              height: 15.h,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
