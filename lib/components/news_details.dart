import 'package:flutter/material.dart';
import 'package:dashboard/const/constants.dart';
import 'news_info_card.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({
    Key? key,
  }) : super(key: key);

  List<Widget> _getData() {
    List<Widget> list = [];
    for (var i = 0; i < 20; i++) {
      list.add(
        Container(
          child: Column(
            children: [
              NewsInfoCard(
                  title: "$i Title news",
                  subTitle: "Container组件应该是最常用的组件之一\nContainer组件可以直接设置其宽高",
                  svgSrc: "svgSrc",
                  author: "张三",
                  time: "2023/10/30"),
              Divider(
                height: 1,
                color: Colors.white70,
                indent: 10,
                endIndent: 10,
              ),
            ],
          ),
        ),
      );
    }
    return list.toList();
  }

  Widget _getItem(index) {
    return Container(
      child: Column(
        children: [
          NewsInfoCard(
              title: "$index Title news",
              subTitle: "Container组件应该是最常用的组件之一\nContainer组件可以直接设置其宽高",
              svgSrc: "svgSrc",
              author: "张三",
              time: "2023/10/30"),
          Divider(
            height: 1,
            color: Colors.white70,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 200,
      itemBuilder: (context, index) {
        return _getItem(index);
      },
    );
  }
}
