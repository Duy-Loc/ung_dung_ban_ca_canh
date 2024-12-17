import 'package:flutter/material.dart';
import 'package:ung_dung_ban_ca_canh/model/fish_product.dart';

import '../../utils/core/app_service.dart';
import '../../utils/core/format_money.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.model}) : super(key: key);

  final FishModel model;

  @override
  // ignore: library_private_types_in_public_api
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  // Dữ liệu sản phẩm mẫu
  List<String> images = [];

  String productName = "Cá Hồi Tươi Nguyên Con (500g)";
  String productPrice = "12.00.0";
  String productCategory = "Thực phẩm tươi sống";

  // TextController cho bình luận đánh giá
  final TextEditingController _commentController = TextEditingController();

  // Danh sách đánh giá mẫu
  List<String> reviews = [
    "Sản phẩm rất tươi, tôi rất hài lòng.",
    "Cá ngon và chất lượng, sẽ mua lại!",
    "Giao hàng nhanh chóng, sản phẩm đúng như mô tả."
  ];
  String image = '';

  @override
  Widget build(BuildContext context) {
    if (widget.model.productImages!.isEmpty) {
      images.add(
          'https://static.chotot.com/storage/chotot-kinhnghiem/c2c/2018/10/cac-loai-ca-canh-re-tien-ma-van-dep-hut-hon-dan-choi-ca-13380.jpg');
    } else {
      for (var e in widget.model.productImages!) {
        image = FetchClient().domainNotApi + e.imageUrl!;
        images.add(image);
      }
    }

    productName = widget.model.productName!;
    productPrice = formatCurrency(widget.model.price!);
    // productCategory = widget.model;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi Tiết Sản Phẩm'),
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
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // Giá tiền sản phẩm
              Text(
                'Giá: $productPrice',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),

              // Loại sản phẩm
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Loại sản phẩm: $productCategory',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              // Nút Thêm vào giỏ hàng
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Sản phẩm đã được thêm vào giỏ hàng')),
                      );
                    },
                    child: const Text('Thêm vào giỏ hàng'),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),

              Text(
                'Số lượng sản phẩm: ${widget.model.stockQuantity}.',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 12,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Đánh giá từ khách hàng.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              Text(widget.model.description!,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400)),
              // Đánh giá sản phẩm
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Đánh giá từ khách hàng',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // Danh sách đánh giá từ người dùng
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
                    margin: const EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 205, 205),
                        borderRadius: BorderRadius.circular(18)),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg'),
                        radius: 20,
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.delete),
                      //   onPressed: () {
                      //     setState(() {
                      //       reviews.removeAt(index);
                      //     });
                      //   },
                      // ) ,
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          reviews[index],
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                      title: const Text(
                        '#asdj@gmail.com',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
              // Nhập bình luận đánh giá
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Bình luận của bạn',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              // const Flexible(child: SizedBox()),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: TextField(
                  controller: _commentController, 
                  decoration: InputDecoration(
                    hintText: 'Nhập bình luận của bạn...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        if (_commentController.text.isNotEmpty) {
                          setState(() {
                            reviews.add(_commentController.text);
                            _commentController.clear();
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Bình luận đã được gửi')),
                          );
                        }
                      },
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
