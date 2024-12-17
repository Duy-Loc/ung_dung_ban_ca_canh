import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ung_dung_ban_ca_canh/model/category_model.dart';

import '../../controller/home_controller.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Danh sách các loại cá
   List<CategoryModel> catogiresPicked = [
    
  ];

  final homeController = Get.find<HomeController>();

  // Trạng thái CheckBox

  @override
  void initState() {
    super.initState();
    // Khởi tạo tất cả giá trị là false
    catogiresPicked =  homeController.categoriesAnc  ;
    // for (var category in categories) {
    //   selectedCategories[category] = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Lọc loại cá'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: catogiresPicked.map((category) {
            return CheckboxListTile(
              title: Text(category.categoryName!),
              value: category.isPicked ?? false ,
              onChanged: (bool? value) {
                setState(() {
                  category.isPicked  = value ?? false;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          child: Text('Hủy'),
          onPressed: () {
            // Navigator.of(context).pop();
            Get.back();
          },
        ),
        TextButton(
          child: const Text('Xác nhận'),
          onPressed: () {
            // Xử lý các danh mục đã chọn
            // List<String> selected = catogiresPicked
            //     .where((entry) => entry.isPicked)
            //     .map((entry) => entry.key)
            //     .toList();
            // Navigator.of(context).pop();
             Get.back();
          },
        ),
      ],
    );
  }
}
