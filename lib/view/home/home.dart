import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_vaping_app/notifier/bottom_bar_notifier.dart';
import 'package:the_vaping_app/view/contact/contact.dart';
import 'package:the_vaping_app/view/store/store.dart';
import 'package:the_vaping_app/widget/bottom_bar_widget.dart';
import 'package:the_vaping_app/widget/loader.dart';
import 'package:the_vaping_app/widget/tab_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              const TabBarWidget(),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                     Loader(),
                     Loader(),
                     Loader(),
                     Store(),
                     ContactView(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomBarWidget(onTap: (index) {
            context.read(bottomBarProvider.notifier).setIndex(index);
            _tabController.animateTo(index);
          }),
        ),
      ),
    );
  }
}
