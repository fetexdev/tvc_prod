import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_vaping_app/const/assets.dart';
import 'package:the_vaping_app/const/strings.dart';
import 'package:the_vaping_app/notifier/bottom_bar_notifier.dart';
import 'package:the_vaping_app/utils/sizer.dart';

class BottomBarWidget extends StatelessWidget {
  final Function(int index) onTap;
  const BottomBarWidget({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final index = watch(bottomBarProvider);
        return BottomNavigationBar(
          currentIndex: index,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14.sp,
          selectedFontSize: 14.sp,
          unselectedItemColor: Colors.grey.shade700,
          selectedItemColor: Colors.white,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: AppStrings.fidelity),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news), label: AppStrings.social),
            BottomNavigationBarItem(
                icon: Image.asset(Assets.logoTVC, width: 24, height: 24),
                label: AppStrings.home),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map), label: AppStrings.store),
            const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone_circle),
                label: AppStrings.contacts),
          ],
          onTap: onTap,
        );
      },
    );
  }
}
