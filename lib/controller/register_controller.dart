
import 'dart:io';

import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/utils/core/app_service.dart';

class RegisterController extends GetxController {
  RxString username =  "".obs ;
  RxString password = "".obs ;
  RxBool isLoading  = false.obs ;
  FetchClient apiService = FetchClient();

  handleLoginProcees({required String username,required String password ,required String email}) async {
    isLoading.value = true;
    final response = await apiService.postData(path: '/account/register',
        params: {'username': username, 'password': password ,  'email' : email});
      
    isLoading.value = false ;  
  }
}