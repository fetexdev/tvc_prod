import 'package:flutter/material.dart';
import '../utils/color_palette.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool? isPassword;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final bool? expanded;
  const TextFieldWidget({
    Key? key,
    required this.textEditingController,
    required this.hint,
    this.isPassword,
    this.textInputType,
    this.onChanged,
    this.onEditingComplete,
    this.margin,
    this.maxLines,
    this.expanded,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isTextObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: TextFormField(
        maxLines: widget.maxLines,
        expands: widget.expanded ?? false,
        controller: widget.textEditingController,
        obscureText: widget.isPassword != null && isTextObscured ? true : false,
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        style: const TextStyle().copyWith(color: Colors.white),
        cursorColor: ColorPalette.primary,
        decoration: InputDecoration(
          hintText: " ${widget.hint}",
          border: InputBorder.none,
          hintStyle:
              const TextStyle().copyWith(color: Colors.white, fontSize: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorPalette.primary,
            ),
          ),
          suffixIcon: widget.isPassword != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isTextObscured = !isTextObscured;
                      });
                    },
                    child: isTextObscured
                        ? Icon(Icons.visibility_off,
                            color: Colors.grey.shade700)
                        : Icon(Icons.visibility, color: Colors.grey.shade700),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
