import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/home_controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final HomeController c = Get.put(HomeController());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(
            child: Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(child: Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final HomeController c = Get.find();
  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
        body: Center(child: Obx(() => Text("${c.count}"))
        ),
        floatingActionButton: FloatingActionButton(onPressed: () => c.decrement()  , child: Icon(Icons.remove),)
     );
  }
}