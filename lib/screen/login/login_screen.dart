import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/login_controller.dart';
import 'package:ung_dung_ban_ca_canh/screen/home/home_screen.dart';
import 'package:ung_dung_ban_ca_canh/screen/register/register_sreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  late LoginController controller ;
  @override
  void initState() {
  
    super.initState();
   controller  = Get.put(LoginController());
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title:  Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
           const SizedBox(height: 20),
            Obx(() {
              if(controller.isLoading.value == true )
                {
                  return CircularProgressIndicator();
                }
              if(controller.isLoginSuccess.value == true)
                {
                  // Get.snackbar("Login succes", "Ban tum lum ") ;
                  Get.to(() => HomeScreen());
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
                Get.to(() => RegisterScreen());
              },
              child: Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
