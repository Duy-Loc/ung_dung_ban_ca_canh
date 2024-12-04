import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Dữ liệu sản phẩm mẫu
  final List<String> images = [
    'https://via.placeholder.com/200x200.png?text=Product+Image+1',
    'https://via.placeholder.com/200x200.png?text=Product+Image+2',
    'https://via.placeholder.com/200x200.png?text=Product+Image+3',
  ];

  final String productName = "Cá Hồi Tươi Nguyên Con (500g)";
  final num productPrice = 120000;
  final String productCategory = "Thực phẩm tươi sống";

  // TextController cho bình luận đánh giá
  final TextEditingController _commentController = TextEditingController();

  // Danh sách đánh giá mẫu
  final List<String> reviews = [
    "Sản phẩm rất tươi, tôi rất hài lòng.",
    "Cá ngon và chất lượng, sẽ mua lại!",
    "Giao hàng nhanh chóng, sản phẩm đúng như mô tả."
  ];

  // Hàm định dạng giá tiền
  String formatCurrency(num amount) {
    return "${amount.toStringAsFixed(0).replaceAll(RegExp(r'(?<=\d)(?=(\d{3})+(\.))'), r'.$&')} VND";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi Tiết Sản Phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hình ảnh sản phẩm
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(images[index], fit: BoxFit.cover),
                    );
                  },
                ),
              ),

              // Tên sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  productName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Giá tiền sản phẩm
              Text(
                'Giá: ${formatCurrency(productPrice)}',
                style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
              ),

              // Loại sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Loại sản phẩm: $productCategory',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),

              // Nút Thêm vào giỏ hàng
              ElevatedButton(
                onPressed: () {
                  // Xử lý thêm vào giỏ hàng
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sản phẩm đã được thêm vào giỏ hàng')),
                  );
                },
                child: Text('Thêm vào giỏ hàng'),
              ),

              // Đánh giá sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Đánh giá từ khách hàng',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              // Danh sách đánh giá từ người dùng
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.star, color: Colors.amber, size: 20),
                      title: Text(
                        reviews[index],
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),

              // Nhập bình luận đánh giá
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Bình luận của bạn',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: 'Nhập bình luận của bạn...',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        setState(() {
                          reviews.add(_commentController.text);
                          _commentController.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Bình luận đã được gửi')),
                        );
                      }
                    },
                  ),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
