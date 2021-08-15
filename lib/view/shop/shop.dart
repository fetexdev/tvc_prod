import 'package:flutter/material.dart';
import 'package:the_vaping_app/utils/page_navigator.dart';

class ShopView extends StatelessWidget {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          onPressed: () => PageNavigator.pop(context),
          icon: const Icon(Icons.close, color: Colors.white, size: 32),
        ),
      ),
      body: Container(),
    );
  }
}
