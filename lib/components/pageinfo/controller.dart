import 'package:get/get.dart';

class PageinfoController extends GetxController {
  PageinfoController();

  _initData() {
    update(["pageinfo"]);
  }

  void onUpdate() {
    number++;
    number2++;
    print(number);
    update();
  }

  var number = 0;
  var number2 = 0;
  void add() {
    number++;
    number2++;
    print(number);
    update(["pageinfo"]);
  }

  void add2() {
    number++;
    number2++;
    print(number2);
    update(["pageinfo2"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
