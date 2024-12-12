import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';

class DrawerInformationUser extends StatelessWidget {
  DrawerInformationUser({super.key});
  final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    bool isLogined = loginController.isLoginSuccess.value;
    return isLogined
        ? DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.redAccent,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar (Ảnh đại diện người dùng)
                CircleAvatar(
                  radius: 30,
                  backgroundImage: const NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnQ0vTNLstwaCcggjf0QKaiYI87JmMM8QirA&s'), // Thay bằng URL ảnh đại diện thực tế
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(width: 16),
                // Thông tin người dùng (Tên và username)
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cao Trường Vũ', // Tên người đăng nhập (Thay thế bằng dữ liệu thực tế)
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@VuNguyenCoder', // Tên người dùng (Username)
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Vui lòng đăng nhập',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          );
  }
}
