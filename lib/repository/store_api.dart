import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_vaping_app/const/api_url.dart';
import 'package:the_vaping_app/model/store_model.dart';

final allStoreDataProvider = FutureProvider.autoDispose((ref) async {
  ref.maintainState = true;
  final storeData = ref.watch(storeDataProvider);

  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  final data = await storeData.getData(cancelToken: cancelToken);

  return data;
});

final storeDataProvider = Provider((_) => StoreApi());

class StoreApi {
  Future<List<StoreModel>?> getData({required CancelToken cancelToken}) async {
    try {
      return await Dio()
          .get(ApiUrl.storeData, cancelToken: cancelToken)
          .then((value) {
        if (value.statusCode == 200) {
          if (value.data != null) {
            final results = List<Map<String, dynamic>>.from(value.data);

            List<StoreModel> storesData = results
                .map((storeData) => StoreModel.fromJson(storeData))
                .toList();

            return storesData;
          } else {
            return null;
          }
        } else {
          return null;
        }
      });
    } catch (_) {
      return null;
    }
  }
}
