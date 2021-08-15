import 'package:flutter/material.dart';
import 'package:the_vaping_app/utils/sizer.dart';

class SizerWidget extends StatefulWidget {
  final Widget Function(BuildContext context) builder;

  const SizerWidget({Key? key, required this.builder}) : super(key: key);

  @override
  _SizerWidgetState createState() => _SizerWidgetState();
}

class _SizerWidgetState extends State<SizerWidget> {
  @override
  void didChangeDependencies() {
    Sizer.initializer(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
