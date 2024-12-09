import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/login_controller.dart';
import 'package:ung_dung_ban_ca_canh/screen/home/home_screen.dart';
import 'package:ung_dung_ban_ca_canh/screen/register/register_sreen.dart';

import '../../utils/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final controller  = Get.find<LoginController>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
           const SizedBox(height: 20),
            Obx(() {
              if(controller.isLoading.value )
                {
                  return CircularProgressIndicator();
                }
              if(controller.isLoginSuccess.value == true)
                {
                  Get.toNamed(Routes.home) ;
                }
              return ElevatedButton(
                onPressed: () {
                  controller.handleLoginProcees(emailController.text.toString(), passwordController.text.toString()) ;
                },
                child: const Text('Login'),
              ) ;
            }) ,
            TextButton(
              onPressed: () {
                Get.toNamed(Routes.register) ;
              },
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
