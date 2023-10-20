import 'package:flutter/material.dart';
import 'package:dashboard/const/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  State<MainFrame> createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  /// 当前的索引值
  int _currentIndex = 0;

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
          Expanded(
            child: Drawer(
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  DrawerListTile(
                    title: "Dashboard",
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    press: () {
                      print('dashboard');
                      _pageController.jumpToPage(0);
                    },
                  ),
                  DrawerListTile(
                    title: "Transaction",
                    svgSrc: "assets/icons/menu_tran.svg",
                    press: () {
                      print('Transaction');
                      _pageController.jumpToPage(1);
                    },
                  ),
                  DrawerListTile(
                    title: "Task",
                    svgSrc: "assets/icons/menu_task.svg",
                    press: () {
                      print('Task');
                      _pageController.jumpToPage(2);
                    },
                  ),
                  DrawerListTile(
                    title: "Documents",
                    svgSrc: "assets/icons/menu_doc.svg",
                    press: () {
                      print('Documents');
                      _pageController.jumpToPage(3);
                    },
                  ),
                  DrawerListTile(
                    title: "Store",
                    svgSrc: "assets/icons/menu_store.svg",
                    press: () {
                      print('Store');
                      _pageController.jumpToPage(4);
                    },
                  ),
                  DrawerListTile(
                    title: "Notification",
                    svgSrc: "assets/icons/menu_notification.svg",
                    press: () {
                      print('Notification');
                      _pageController.jumpToPage(5);
                    },
                  ),
                  DrawerListTile(
                    title: "Profile",
                    svgSrc: "assets/icons/menu_profile.svg",
                    press: () {
                      print('Profile');
                      _pageController.jumpToPage(6);
                    },
                  ),
                  DrawerListTile(
                    title: "Settings",
                    svgSrc: "assets/icons/menu_setting.svg",
                    press: () {
                      print('Settings');
                      _pageController.jumpToPage(7);
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: PageView(
              controller: _pageController,
              children: [
                Text('A0'),
                Text('A1'),
                Text('A2'),
                Text('A3'),
                Text('A4'),
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

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
