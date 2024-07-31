
import 'package:get/get.dart';
import 'package:uber_udit/features/HomePage/homepage_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => HomePageController());
  }

}