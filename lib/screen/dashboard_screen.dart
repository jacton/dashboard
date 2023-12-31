import 'package:flutter/material.dart';
import 'package:dashboard/ui/window_top_bar.dart';
import 'package:dashboard/screen/main_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuAppController>().scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            WindowsTopBar(),
            Divider(
              height: 1,
              color: Colors.red,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
              child: MainFrame(),
            ),
          ],
        ),
      ),
    );
  }
}

// class BodyScreen extends StatelessWidget {
//   BodyScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Expanded(
//               // default flex = 1
//               // and it takes 1/6 part of the screen
//               child: SideMenu(),
//             ),
//             Expanded(
//               // It takes 5/6 part of the screen
//               flex: 5,
//               child: BodyPage(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BodyPage extends StatefulWidget {
//   const BodyPage({Key? key}) : super(key: key);

//   @override
//   State<BodyPage> createState() => _BodyPageState();
// }

// class _BodyPageState extends State<BodyPage> {
//   final PageController _ctrl = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _ctrl,
//       children: [
//         StorageDetails(),
//         StorageDetails(),
//       ],
//     );
//   }
// }
