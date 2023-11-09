import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'routeview.dart';

class PageinfoPage extends StatelessWidget {
  PageinfoPage({Key? key}) : super(key: key);
  final logic = Get.put(PageinfoController());

  // @override
  // Widget build(BuildContext context) {
  //   return GetBuilder<PageinfoController>(
  //     init: logic,
  //     // initState: (_) {},
  //     id: "pageinfo",
  //     builder: (_) {
  //       return Container(
  //         padding: const EdgeInsets.all(4.0),
  //         height: 100,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Obx(() => Text('你点击了${logic.number}次')),
  //             ElevatedButton(
  //               onPressed: () {
  //                 logic.add();
  //                 print('add');
  //               },
  //               child: const Text('增加'),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetBuilder<PageinfoController>(
            id: "pageinfo",
            builder: (_) => Text('你点击了${logic.number}次'),
          ),
          GetBuilder<PageinfoController>(
            id: "pageinfo2",
            builder: (_) => Text('你点击了${logic.number2}次'),
          ),
          GetBuilder<PageinfoController>(
            builder: (_) => Text('你点击了${logic.number}次'),
          ),
          ElevatedButton(
            onPressed: () {
              logic.add();
              print('add');
            },
            child: const Text('增加'),
          ),
          ElevatedButton(
            onPressed: () {
              logic.add2();
              print('add2');
            },
            child: const Text('增加2'),
          ),
          ElevatedButton(
            onPressed: () {
              logic.onUpdate();
              print('onUpdate');
            },
            child: const Text('刷新'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(RouteViewPage());
              print('go to routeview');
            },
            child: const Text('路由'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(RouteViewMain(
                title: "路由2",
                children: RouteViewDemo(),
              ));
              print('go to routeview');
            },
            child: const Text('路由2'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(RouteViewMain(
                title: "路由3",
                children: Text("hello world"),
              ));
              print('go to routeview');
            },
            child: const Text('路由3'),
          ),
        ],
      ),
    );
  }
}
