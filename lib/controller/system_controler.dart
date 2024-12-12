import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/home_controller.dart';
import 'package:ung_dung_ban_ca_canh/controller/register_controller.dart';

import 'login_controller.dart';

class SystemController extends GetxController {
  final isShowLogout = false.obs;

  late HomeController homeController;
  late LoginController loginController;
  late RegisterController registerController;

  initControllerApp() {
    homeController = Get.put(HomeController());
    loginController = Get.put(LoginController());
    registerController = Get.put(RegisterController());
  }
}
