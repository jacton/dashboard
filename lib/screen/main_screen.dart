import 'package:dashboard/screen/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dashboard/components/storage_details.dart';
import 'package:dashboard/components/news_details.dart';
import 'package:dashboard/components/table_info.dart';
import 'package:dashboard/components/pageinfo/view.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  /// 当前的索引值
  /// PageView 控制器 , 用于控制 PageView
  final _pageController = PageController(
    /// 初始索引值
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: SideMenu(pageController: _pageController),
          ),
          Expanded(
            // flex: 5,
            child: PageView(
              controller: _pageController,
              children: [
                Text('A0'),
                StorageDetails(),
                NewsDetails(),
                TableInfo(),
                PageinfoPage(),
                Text('A5'),
                Text('A6'),
                Text('A7'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
