import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_vaping_app/const/assets.dart';
import 'package:the_vaping_app/const/strings.dart';
import 'package:the_vaping_app/utils/color_palette.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/widget/clip_shadow.dart';
import 'package:the_vaping_app/widget/sky_clipper.dart';
import 'package:the_vaping_app/widget/text_form_field_widget.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          width: Sizer().width,
          height: Sizer().height - (kToolbarHeight + 56),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 23.w),
                    TextWidget(
                      text: AppStrings.loginTitle,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: "Impact",
                    ),
                    SizedBox(height: 2.w),
                    TextWidget(
                      text: AppStrings.loginSubtitle,
                      fontSize: 16.sp,
                      color: ColorPalette.primary,
                      fontFamily: "Impact",
                    ),
                    const Spacer(),
                    TextWidget(
                      edgeInsetsGeometry:
                          const EdgeInsets.only(left: 8, bottom: 8),
                      text: "Email",
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    TextFieldWidget(
                      textEditingController: TextEditingController(),
                      hint: AppStrings.insertEmail,
                    ),
                    SizedBox(height: 2.w),
                    TextWidget(
                      edgeInsetsGeometry:
                          const EdgeInsets.only(left: 8, bottom: 8),
                      text: "Password",
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    TextFieldWidget(
                      textEditingController: TextEditingController(),
                      hint: AppStrings.insertPassword,
                    ),
                    SizedBox(height: 5.w),
                    TextWidget(
                      alignmentGeometry: Alignment.center,
                      text: AppStrings.restorePassword,
                      fontSize: 14.sp,
                      color: Colors.grey.shade500,
                    ),
                    const Spacer(),
                    Container(
                      width: Sizer().width,
                      height: Sizer().height / 15,
                      color: ColorPalette.primary,
                      child: TextWidget(
                        alignmentGeometry: Alignment.center,
                        text: AppStrings.access,
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.w),
                    Center(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: TextWidget(
                          alignmentGeometry: Alignment.center,
                          text: AppStrings.notRegistered,
                          fontSize: 13.sp,
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.w),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: Sizer().width,
                    height: 100.h,
                    color: Colors.transparent,
                    child: ClipShadowPath(
                      shadow: BoxShadow(
                          blurRadius: 5,
                          spreadRadius: 10,
                          color: Colors.grey.shade900,
                          offset: const Offset(-5, 3)),
                      clipper: SkyClipper(),
                      child: Container(color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 15.h,
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.asset(
                          Assets.logoTVCBlack,
                          alignment: Alignment.centerRight,
                          width: 12.h,
                          height: 12.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
