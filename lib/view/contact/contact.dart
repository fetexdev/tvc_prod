import 'package:flutter/material.dart';
import 'package:the_vaping_app/const/assets.dart';
import 'package:the_vaping_app/const/strings.dart';
import 'package:the_vaping_app/utils/color_palette.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/widget/text_form_field_widget.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        width: Sizer().width,
        height:
            Sizer().height - (kToolbarHeight * 2) - kBottomNavigationBarHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 2.w),
            Container(
              height: 15.h,
              color: Colors.transparent,
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Material(
                        elevation: 8,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            color: Colors.grey.shade900,
                          ),
                          child: Center(
                            child: index == 0
                                ? Image.asset(Assets.messangerIcon)
                                : index == 1
                                    ? Image.asset(Assets.instagramIcon)
                                    : const Icon(Icons.phone, size: 48),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 5.w),
            Flexible(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: ColorPalette.primary,
                        child: Center(
                          child: Icon(
                            Icons.email,
                            color: Colors.grey.shade900,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.grey.shade900,
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Spacer(),
                            TextWidget(
                              text: AppStrings.subject,
                              color: ColorPalette.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              fontFamily: "Impact",
                              letterSpacing: 0.8,
                            ),
                            SizedBox(height: 2.w),
                            TextFieldWidget(
                              textEditingController: TextEditingController(),
                              hint: AppStrings.insertSubject,
                            ),
                            SizedBox(height: 5.w),
                            TextWidget(
                              text: AppStrings.messageBody,
                              color: ColorPalette.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              fontFamily: "Impact",
                              letterSpacing: 0.8,
                            ),
                            SizedBox(height: 2.w),
                            Flexible(
                              flex: 3,
                              child: TextFieldWidget(
                                textEditingController: TextEditingController(),
                                hint: AppStrings.insertMessageBody,
                                maxLines: null,
                                expanded: true,
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorPalette.primary, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  color: Colors.black,
                                ),
                                child: TextWidget(
                                  alignmentGeometry: Alignment.center,
                                  text: AppStrings.send,
                                  color: ColorPalette.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  letterSpacing: 0.8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.w),
          ],
        ),
      ),
    );
  }
}
