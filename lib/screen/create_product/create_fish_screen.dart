import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<File> _images = [];
  final List<Map<String, dynamic>> _categories = [
    {'id': 1, 'nameCategory': 'Electronics'},
    {'id': 2, 'nameCategory': 'Clothing'},
    {'id': 3, 'nameCategory': 'Home Appliances'},
    {'id': 4, 'nameCategory': 'Books'},
    {'id': 5, 'nameCategory': 'Toys'},
  ];
  String? _selectedCategory;

  _pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();
    if (pickedFiles != null && pickedFiles.length + _images.length <= 4) {
      setState(() {
        _images.addAll(pickedFiles.map((file) => File(file.path)));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chỉ được chọn tối đa 4 hình ảnh!')),
      );
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _images.isNotEmpty &&
        _selectedCategory != null) {
      print('Name: ${_nameController.text}');
      print('Quantity: ${_quantityController.text}');
      print('Description: ${_descriptionController.text}');
      print('Category: $_selectedCategory');
      print('Images: ${_images.map((e) => e.path).toList()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sản phẩm được thêm thành công!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Vui lòng nhập đủ thông tin và chọn hình ảnh.')),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thêm mới sản phẩm')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm
                TextFormField(
                  controller: _nameController,
                  decoration: _inputDecoration('Tên sản phẩm'),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập tên sản phẩm' : null,
                ),
                SizedBox(height: 12),
                // Số lượng
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: _inputDecoration(
                      'Số lượng sản phẩm'), // InputDecoration(labelText: 'Số lượng sản phẩm'),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập số lượng' : null,
                ),
                SizedBox(height: 12),
                // Mô tả
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: _inputDecoration('Mô tả sản phẩm'),
                  validator: (value) =>
                      value!.isEmpty ? 'Vui lòng nhập mô tả sản phẩm' : null,
                ),
                SizedBox(height: 12),
                // Chọn danh mục
                DropdownButtonFormField<String>(
                  decoration: _inputDecoration('Chọn danh mục'),
                  value: _selectedCategory,
                  onChanged: (newValue) =>
                      setState(() => _selectedCategory = newValue),
                  items: _categories.map<DropdownMenuItem<String>>((category) {
                    return DropdownMenuItem<String>(
                      value: category['nameCategory'],
                      child: Text(category['nameCategory']),
                    );
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Vui lòng chọn danh mục' : null,
                ),
                SizedBox(height: 12),
                // Hình ảnh
                Text('Hình ảnh (được chọn tối đa 4):'),
                SizedBox(height: 8),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickImages,
                      child: const Text('Chọn hình'),
                    ),
                    const SizedBox(width: 12),
                    Text('${_images.length} / 4 đã chọn'),
                  ],
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _images
                      .map((image) => Image.file(image,
                          width: 100, height: 100, fit: BoxFit.cover))
                      .toList(),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Thêm sản phẩm'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
