import 'package:get/get.dart';



class LoginController extends GetxController{
  RxString username =  "".obs ;
  RxString password = "".obs ;
  RxBool isLoading  = false.obs ;
  RxBool isLoginSuccess =  false.obs ;
  
  onRefresh() {
    username.value =  "" ;
    password.value = "" ;
    isLoading.value = false ;
    isLoginSuccess.value = false ;
  }

  handleLoginProcees(String username , String password) async {
    isLoading.value = true ;
     if(username == "MihHiu" && password == "MihHiu")
       {
         isLoginSuccess.value = true ;
         isLoading.value = false ;
       }else {
         isLoading.value = false ;
       }
  }

}