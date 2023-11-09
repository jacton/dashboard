import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dashboard/ui/windows_adapter.dart';

import 'index.dart';

class RouteViewMain extends StatelessWidget {
  const RouteViewMain({Key? key, required this.title, required this.children})
      : super(key: key);
  final Widget children;
  final String title;
  _buildTitle() {
    return DragToMoveAreaNoDouble(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                print("左侧按钮");
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Text(title),
          IconButton(
              onPressed: () {
                print("左侧按钮");
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          Divider(
            height: 1,
            color: Colors.red,
            indent: 10,
            endIndent: 10,
          ),
          Expanded(child: children),
        ],
      ),
    ));
  }
}

class RouteViewDemo extends StatelessWidget {
  const RouteViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
        ),
        Text('路由界面2'),
        ElevatedButton(
          onPressed: () {
            Get.back();
            print('get back');
          },
          child: const Text('返回'),
        ),
      ],
    );
  }
}

class RouteViewPage extends StatelessWidget {
  RouteViewPage({Key? key}) : super(key: key);
  final logic = Get.put(PageinfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DragToMoveAreaNoDouble(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        print("左侧按钮");
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text('路由界面'),
                  IconButton(
                      onPressed: () {
                        print("左侧按钮");
                      },
                      icon: const Icon(Icons.settings)),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.red,
              indent: 10,
              endIndent: 10,
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                Text('路由界面1'),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    print('get back');
                  },
                  child: const Text('返回'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
