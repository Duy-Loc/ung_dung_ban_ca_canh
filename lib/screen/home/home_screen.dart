import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/controller/home_controller.dart';
import 'package:ung_dung_ban_ca_canh/controller/login_controller.dart';
import 'package:ung_dung_ban_ca_canh/screen/home/filter_dialog.dart';

import '../../model/product_card.dart';
import 'search_textfield_widget.dart';

class HomeScreen extends StatelessWidget {

  final HomeController c = Get.put(HomeController());
  // final LoginController lC =  Get.find<LoginController>() ;

  final List<Map<String, dynamic>> products = List.generate(
    100,
        (index) => {
      'name': 'Sản phẩm cá cảnh số $index',
      'price': (index + 1) * 10 ,
      'image': 'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2018/10/cac-loai-ca-canh-re-tien-ma-van-dep-hut-hon-dan-choi-ca-13380.jpg',
      'reviews': (index + 5) % 10 + 1,
    },
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Trang chủ'),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_alt_outlined), // Biểu tượng lọc
              tooltip: 'Lọc loại cá',
              onPressed: () {
                // Thêm hành động xử lý khi nhấn vào nút filter
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return FilterDialog() ;
                  },
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar (Ảnh đại diện người dùng)
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnQ0vTNLstwaCcggjf0QKaiYI87JmMM8QirA&s'), // Thay bằng URL ảnh đại diện thực tế
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(width: 16),
                    // Thông tin người dùng (Tên và username)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Võ Trường Vũ',  // Tên người đăng nhập (Thay thế bằng dữ liệu thực tế)
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@VuNguyenCoder',  // Tên người dùng (Username)
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: Text(
              //     'Vui lòng đăng nhập',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 24,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: Text('Thông tin người dùng'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.shopping_cart),
              //   title: Text('Chi tiết giỏ hàng'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: Icon(Icons.logout),
              //   title: Text('Đăng xuất'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.login_rounded), // Biểu tượng đăng nhập
                title: Text('Đăng xuất'),
                onTap: () {
                  Navigator.pop(context);
                  // Thêm hành động khi nhấn vào, ví dụ điều hướng đến màn hình đăng nhập
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchTextField(
                    onSearch: (query) {
                      print('Tìm kiếm: $query');
                      // Thêm logic xử lý tìm kiếm ở đây
                    },
                  )),
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8.0),
                physics:const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisExtent: 280,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: products[index]['name'],
                    price: products[index]['price'] ,
                    imageUrl: products[index]['image'],
                    reviews: products[index]['reviews'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
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