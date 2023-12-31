import 'package:flutter/material.dart';
import 'package:dashboard/components/himalaya/logic.dart';
import 'package:dashboard/components/himalaya/state.dart';
import 'package:dashboard/const/function.dart';
import 'package:get/get.dart';

class HimalayaNewest extends StatelessWidget {
  const HimalayaNewest({
    Key? key,
    required this.data,
    required this.onSortTitle,
    required this.onNewest,
  }) : super(key: key);

  ///数据源
  final HimalayaState data;

  ///点击标题栏目
  final ParamSingleCallback<HimalayaSubItemInfo> onSortTitle;

  ///猜你喜欢具体栏目
  final ParamSingleCallback<HimalayaSubItemInfo> onNewest;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      //标题 + 子栏目细分
      Row(children: [
        //标题
        _buildTitle(),

        //分类标题
        _buildSortTitle(),
      ]),

      //精选具体card
      _buildCardBg(builder: (item) {
        return [
          //图片卡片
          _buildPicCard(item),

          //文字描述
          Text(item.title,
              style: TextStyle(fontSize: 15, color: Colors.redAccent)),

          //子标题
          _buildSubTitle(item),
        ];
      }),
    ]);
  }

  Widget _buildSubTitle(HimalayaSubItemInfo item) {
    return Text(
      '${item.subTitle}',
      style: TextStyle(fontSize: 13, color: Colors.grey),
    );
  }

  Widget _buildPicCard(HimalayaSubItemInfo item) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.only(top: 16, bottom: 6),
      decoration: const BoxDecoration(),
      child: GestureDetector(
        onTap: () => onNewest(item),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(item.tag ?? ''),
        ),
      ),
    );
  }

  Widget _buildCardBg({
    required List<Widget> Function(HimalayaSubItemInfo item) builder,
  }) {
    return Wrap(
      runSpacing: 20,
      spacing: 12,
      children: List.generate(data.newestCardList.length, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: builder(data.newestCardList[index]),
        );
      }),
    );
  }

  Widget _buildSortTitle() {
    return Row(
      children: data.newestSortList.map((e) {
        return GestureDetector(
          onTap: () => onSortTitle(e),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: GetBuilder<HimalayaLogic>(
              builder: (logic) {
                return Text(
                  e.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: e.isSelected ? Colors.red : Colors.grey,
                  ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Text(
        '最新精选',
        style: TextStyle(
          color: Colors.black,
          fontSize: 21,
        ),
      ),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      width: 800,
      margin: EdgeInsets.only(top: 28, bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
