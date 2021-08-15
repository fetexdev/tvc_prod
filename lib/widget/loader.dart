import 'package:flutter/material.dart';
import 'package:the_vaping_app/utils/color_palette.dart';

class Loader extends StatelessWidget {
  final double? width;
  final double? height;
  const Loader({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.transparent,
      child: const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorPalette.primary)),
      ),
    );
  }
}
