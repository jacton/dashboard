import 'package:flutter/material.dart';

class ScrollInfo extends StatelessWidget {
  const ScrollInfo({
    Key? key,
  }) : super(key: key);

  Widget _buildScrollView() {
    List<Text> _list = [];
    for (var i = 0; i < 100; i++) {
      _list.add(Text('item$i'));
    }
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.red),
      ),
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Column(children: _list),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      height: 100,
      width: 200,
      margin: EdgeInsets.only(top: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.red),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Center(
        child: Text("bottom"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: _buildScrollView(),
      ),
      _buildBottom(),
    ]);
  }
}
