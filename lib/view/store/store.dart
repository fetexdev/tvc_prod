import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_vaping_app/repository/store_api.dart';
import 'package:the_vaping_app/view/store/map.dart';
import 'package:the_vaping_app/widget/loader.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return watch(allStoreDataProvider).when(
          data: (value) {
            if (value != null) {


              List<GlobalKey> _globalKeys = [];

              for (var i = 0; i < value.length; i++) {
                _globalKeys.add(GlobalKey());
              }
              return MapView(storeModel: value, globalKeys: _globalKeys);
            } else {
              return const SizedBox();
            }
          },
          loading: () {
            return const Loader();
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
        );
      },
    );
  }
}
