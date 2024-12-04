import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final Function(String)? onSearch;

  const SearchTextField({Key? key, this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity ,

      child: TextField(
        onSubmitted: onSearch,
        decoration: InputDecoration(
          hintText: 'Tìm kiếm...',
          hintStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
          contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none, // Không hiển thị viền mặc định
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(color: Colors.blue, width: 2),
          ),
        ),
      ),
    );
  }
}
