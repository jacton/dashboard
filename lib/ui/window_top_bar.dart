import 'package:flutter/material.dart';
import 'package:dashboard/ui/windows_adapter.dart';
import 'package:dashboard/ui/window_buttons.dart';
import 'package:dashboard/const/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WindowsTopBar extends StatefulWidget {
  const WindowsTopBar({Key? key}) : super(key: key);
  @override
  State<WindowsTopBar> createState() => _WindowsTopBarState();
}

class _WindowsTopBarState extends State<WindowsTopBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragToMoveAreaNoDouble(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        // color: Colors.white,
        child: Row(
          children: [
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Container(
              height: 30,
              width: 400,
              child: SearchField1(),
            ),
            const SizedBox(
              width: 20,
            ),
            WindowButtons(),
          ],
        ),
      ),
    );
  }
}

TextField _phoneTextField() {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.lightBlue.shade100,
      prefixIcon: Icon(Icons.phone),
      prefixText: "+86 ",
      prefixStyle: TextStyle(color: Colors.orange, fontSize: 18),
      hintText: "请输入手机号",
      suffixIcon: Icon(Icons.clear),
    ),
  );
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}

class SearchField1 extends StatelessWidget {
  const SearchField1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(fontSize: 12),
      maxLines: 1,
      decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(
            minWidth: 30,
          ),
          filled: true,
          hoverColor: Colors.transparent,
          contentPadding: EdgeInsets.only(top: 0),
          fillColor: secondaryColor,
          prefixIcon: Icon(
            Icons.search,
            size: 18,
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 12, color: Colors.grey)),
    );
  }
}
