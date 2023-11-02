import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              pageController.jumpToPage(0);
            },
          ),
          DrawerListTile(
            title: "Transaction",
            svgSrc: "assets/icons/menu_tran.svg",
            press: () {
              print('Transaction');
              pageController.jumpToPage(1);
            },
          ),
          DrawerListTile(
            title: "Task",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              print('Task');
              pageController.jumpToPage(2);
            },
          ),
          DrawerListTile(
            title: "Documents",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              print('Documents');
              pageController.jumpToPage(3);
            },
          ),
          DrawerListTile(
            title: "Store",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              print('Store');
              pageController.jumpToPage(4);
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              print('Notification');
              pageController.jumpToPage(5);
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              print('Profile');
              pageController.jumpToPage(6);
            },
          ),
          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {
              print('Settings');
              pageController.jumpToPage(7);
            },
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
