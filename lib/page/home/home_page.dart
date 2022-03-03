import 'package:flutter/material.dart';
import 'package:flutter_realm_log_web/page/home/view_model/home_page_view_model.dart';
import 'package:flutter_realm_log_web/page/network_log/network_log_page.dart';
import 'package:flutter_winner_app/flutter_winner_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePage<HomePage, HomePageViewModel>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget buildPage(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          child: TabBar(
            isScrollable: true,
            automaticIndicatorColorAdjustment: false,
            controller: _tabController,
            tabs: const [
              Text(
                "网络日志",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const NetworkLogPage(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  HomePageViewModel create() {
    return HomePageViewModel();
  }
}
