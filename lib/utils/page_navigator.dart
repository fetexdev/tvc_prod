import 'package:flutter/material.dart';

class PageNavigator {
  PageNavigator._();
  static void goTo(BuildContext context, {required dynamic page}) {
    Navigator.of(context).push(_pageRouteBuilder(page));
  }

  static void replaceTo(BuildContext context, {required dynamic page}) {
    Navigator.of(context).pushReplacement(_pageRouteBuilder(page));
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static Route _pageRouteBuilder(dynamic page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
