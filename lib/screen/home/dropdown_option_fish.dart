import 'package:flutter/material.dart';

class MyDropdownMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        padding: EdgeInsets.zero,
      icon: const Icon(Icons.more_vert), // Icon dấu 3 chấm
      onSelected: (String value) {
        // Xử lý khi người dùng chọn một item
        switch (value) {
          case 'update_quantity':
            print('Cập nhập số lượng');
            break;
          case 'update_info':
            print('Cập nhập thông tin');
            break;
          case 'hide_product':
            print('Ẩn sản phẩm');
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'update_quantity',
          child: Text('Cập nhập số lượng'),
        ),
        PopupMenuItem<String>(
          value: 'update_info',
          child: Text('Cập nhập thông tin'),
        ),
        PopupMenuItem<String>(
          value: 'hide_product',
          child: Text('Ẩn sản phẩm'),
        ),
      ],
    );
  }
}
