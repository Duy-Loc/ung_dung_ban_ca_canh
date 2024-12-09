import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/screen/login/login_screen.dart';

import 'utils/routes/app_routes.dart';
import 'utils/routes/routes.dart';

void main() => runApp(

    GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen()));


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
         debugShowCheckedModeBanner: false,
          initialRoute:Routes.root,
          getPages: AppPages.pages,
          title: 'Ban Ca Canh',
           theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            }),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
            useMaterial3: false,
          ),
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
      ) ;  
  }

}