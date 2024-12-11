import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  // Danh sách các loại cá
  final List<String> categories = [
    'Cá chép',
    'Cá lóc',
    'Cá hồi',
    'Cá thu',
    'Cá basa',
  ];

  // Trạng thái CheckBox
  final Map<String, bool> selectedCategories = {};

  @override
  void initState() {
    super.initState();
    // Khởi tạo tất cả giá trị là false
    for (var category in categories) {
      selectedCategories[category] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Lọc loại cá'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: categories.map((category) {
            return CheckboxListTile(
              title: Text(category),
              value: selectedCategories[category],
              onChanged: (bool? value) {
                setState(() {
                  selectedCategories[category] = value ?? false;
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
          child: Text('Xác nhận'),
          onPressed: () {
            // Xử lý các danh mục đã chọn
            List<String> selected = selectedCategories.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList();
            print('Danh mục đã chọn: $selected'); // Hoặc thực hiện hành động khác
            // Navigator.of(context).pop();
             Get.back();
          },
        ),
      ],
    );
  }
}
