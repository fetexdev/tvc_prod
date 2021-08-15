import 'package:flutter/material.dart';

extension SizerExtension on num {
  double get h => this * (Sizer().height - Sizer().verticalPadding) / 100;
  double get w => this * (Sizer().width - Sizer().horizontalPadding) / 100;

  double get sp =>
      this *
      (((h + w) + (Sizer().pixelRatio * Sizer().aspectRatio)) / 2.08) /
      100;
}

class Sizer {
  Sizer();

  static late double _devicePixelRatio;
  static late double _deviceAspectRatio;
  static late double _horizontalPadding;
  static late double _verticalPadding;
  static late double _width;
  static late double _height;

  double get width => _width;
  double get height => _height;
  double get horizontalPadding => _horizontalPadding;
  double get verticalPadding => _verticalPadding;
  double get pixelRatio => _devicePixelRatio;
  double get aspectRatio => _deviceAspectRatio;

  static initializer(BuildContext context) {
    MediaQueryData _data = MediaQuery.of(context);
    _width = _data.size.width;
    _height = _data.size.height;
    _deviceAspectRatio = _data.size.aspectRatio;
    _devicePixelRatio = _data.devicePixelRatio;
    _horizontalPadding = _data.padding.left + _data.padding.right;
    _verticalPadding = _data.padding.top + _data.padding.bottom;
  }
}
