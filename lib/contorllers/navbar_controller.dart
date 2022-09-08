import 'package:get/get.dart';

class NavBarController extends GetxController {
  var toggleNavBar = false.obs;

  void toggle(val) {
    toggleNavBar = val;
    update();
  }
}
