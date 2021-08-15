import 'package:riverpod/riverpod.dart';

final bottomBarProvider = StateNotifierProvider((_) => BottomBarNotifier());

class BottomBarNotifier extends StateNotifier<int> {
  BottomBarNotifier() : super(2);

  void setIndex(int index) {
    if (state != index) {
      state = index;
    }
  }
}
