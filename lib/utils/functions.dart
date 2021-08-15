import 'package:flutter/material.dart';

class Functions {
  static openBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 10,
      context: context,
      builder: (context) => child,
    );
  }
}
