import 'package:code_basic/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}