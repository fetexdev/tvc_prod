import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_vaping_app/model/store_model.dart';
import 'package:the_vaping_app/repository/store_api.dart';
import 'package:the_vaping_app/utils/color_palette.dart';
import 'package:the_vaping_app/utils/sizer.dart';
import 'package:the_vaping_app/view/home/home.dart';
import 'package:the_vaping_app/widget/loader.dart';
import 'package:the_vaping_app/widget/sizer_widget.dart';
import 'package:the_vaping_app/widget/text_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle().copyWith(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      title: 'The Vaping Company App',
      theme: ThemeData(
        accentColor: Colors.grey.shade300,
        accentColorBrightness: Brightness.light,
      ),
      builder: (context, child) => _Unfocus(child: child!),
      home: SizerWidget(builder: (_) => const HomeView()),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
