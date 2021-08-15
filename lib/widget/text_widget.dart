import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final AlignmentGeometry? alignmentGeometry;
  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? letterSpacing;
  const TextWidget({
    Key? key,
    this.alignmentGeometry,
    this.edgeInsetsGeometry,
    required this.text,
    this.textAlign,
    this.maxLines,
    this.color,
    required this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry ?? Alignment.centerLeft,
      child: Padding(
        padding: edgeInsetsGeometry ?? EdgeInsets.zero,
        child: Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
          softWrap: true,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            letterSpacing: letterSpacing,
          ),
        ),
      ),
    );
  }
}
