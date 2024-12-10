import 'package:get/get.dart';

import '../utils/core/app_service.dart';

class LoginController extends GetxController {
  RxString username = "".obs;
  RxString password = "".obs;
  RxBool isLoading = false.obs;
  RxBool isLoginSuccess = false.obs;
  FetchClient apiService = FetchClient();

  onRefresh() {
    username.value = "";
    password.value = "";
    isLoading.value = false;
    isLoginSuccess.value = false;
  }

 Future<void> handleLoginProcees(String username, String password) async {
    isLoading.value = true;
    final response = await apiService.postData(path: '/account/login',
        params: {'userName': username, 'password': password});
            isLoading.value = false;
      if(response.statusCode! >= 200 && response.statusCode! <= 299){
        FetchClient.token = response.data['token'] ; 
        print(FetchClient.token); 
        isLoginSuccess.value = true; 
      }else { 

      }

       
  }
}
