import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/login_controller.dart';

import '../../utils/routes/routes.dart';

class LoginScreen extends GetView<LoginController> {
   LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  // final controller  = Get.find<LoginController>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dang nhap')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'tai khoan'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'mat khau'),
              obscureText: true,
            ),
           const SizedBox(height: 20),
           GetBuilder<LoginController>(builder:(controller) {
            
            if(controller.isLoading.value)
                {
                  return const CircularProgressIndicator();
                }
            if(controller.isLoading.value == false  && controller.isLoginSuccess.value == true)
              {  
               Get.toNamed(Routes.home) ;  
              }
              return ElevatedButton(
                onPressed: () {
                  removeFocus(context);
                   controller.handleLoginProcees(emailController.text.toString(), passwordController.text.toString()) ;
                },
                child: const Text('Dang nhap'),
              ) ;
           },  ) ,  
           
           
          ],
        ),
      ),
    );
  }
}

removeFocus(BuildContext context) {
  final FocusScopeNode currentScope = FocusScope.of(context);
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
