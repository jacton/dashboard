import 'package:flutter/material.dart';
import 'package:dashboard/const/image_config.dart';
import 'package:dashboard/components/himalaya/state.dart';
import 'package:dashboard/const/function.dart';
import 'package:dashboard/ui/custom_single_child_scroll_view.dart';
import 'package:get/get.dart';

import '../logic.dart';

class HimalayaLeftNavigation extends StatelessWidget {
  const HimalayaLeftNavigation({
    Key? key,
    required this.data,
    required this.onTap,
  }) : super(key: key);

  final HimalayaState data;

  final ParamSingleCallback<HimalayaSubItemInfo> onTap;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      //喜马拉雅logo图标
      _buildLogo(),

      //遍历俩层循环：不同item栏目 - 可点击,可滑动
      //第一层：标题 + 子item列表
      //第二层：子item详细布局
      _buildItemListBg(itemBuilder: (item) {
        return [
          //最外层item - 大标题
          _buildTitle(item.title),

          //子栏目 - 列表
          _buildSubItemListBg(item, subBuilder: (subItem) {
            return [
              //选中红色长方形条块
              _buildRedTag(subItem),

              //图标
              _buildItemIcon(subItem),

              //描述
              _buildItemDesc(subItem),
            ];
          })
        ];
      }),
    ]);
  }

  Widget _buildItemDesc(HimalayaSubItemInfo subItem) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: GetBuilder<HimalayaLogic>(
        builder: (logic) {
          return Text(
            subItem.title,
            style: TextStyle(
              color: subItem.isSelected ? Colors.red : Colors.black,
            ),
          );
        },
      ),
    );
  }

  Widget _buildItemIcon(HimalayaSubItemInfo subItem) {
    return GetBuilder<HimalayaLogic>(
      builder: (logic) {
        return Icon(
          subItem.icon,
          size: 18,
          color: subItem.isSelected ? Colors.red : Colors.black,
        );
      },
    );
  }

  Widget _buildRedTag(HimalayaSubItemInfo subItem) {
    return GetBuilder<HimalayaLogic>(
      builder: (logic) {
        return Container(
          height: 17,
          width: 2,
          color: subItem.isSelected ? Colors.red : Colors.transparent,
          margin: EdgeInsets.only(right: 21),
        );
      },
    );
  }

  Widget _buildSubItemListBg(
    HimalayaItemInfo item, {
    required List<Widget> Function(HimalayaSubItemInfo item) subBuilder,
  }) {
    return Column(
      children: List.generate(item.subItemList.length, (index) {
        return InkWell(
          onTap: () => onTap(item.subItemList[index]),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 9),
            child: Row(children: subBuilder(item.subItemList[index])),
          ),
        );
      }),
    );
  }

  Widget _buildItemListBg({
    required List<Widget> Function(HimalayaItemInfo item) itemBuilder,
  }) {
    return Expanded(
      child: Scrollbar(
        child: CustomSingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(data.leftItemList.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: itemBuilder(data.leftItemList[index]),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Container(
      margin: EdgeInsets.only(left: 23, top: 20, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(left: 23),
      child: Image.network(
        ImageHimalayaConfig.logo,
        width: 100,
      ),
    );
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      color: Colors.grey.withOpacity(0.06),
      padding: EdgeInsets.only(top: 18),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
