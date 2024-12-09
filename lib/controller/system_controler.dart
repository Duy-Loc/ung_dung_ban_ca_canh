import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/home_controller.dart';
import 'package:ung_dung_ban_ca_canh/controller/register_controller.dart';

import 'login_controller.dart';

class SystemController extends GetxController {
  final isShowLogout = false.obs ;  

  HomeController homeController = Get.put(HomeController());
  LoginController loginController = Get.put(LoginController());
  RegisterController registerController = Get.put(RegisterController());


  
 }