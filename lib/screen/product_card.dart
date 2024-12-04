import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'detail_product_screen.dart';
import 'format_money.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final num price;
  final String imageUrl;
  final int reviews;

  const ProductCard({
    Key? key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailPage()) ;
      },
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 165, // 2/3 chiều cao của 280
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Hình ảnh đã tải xong
                  }
                  return Container(
                    height: 165,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Container(
                    height: 165,
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0 , vertical: 4.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatCurrency(price*1000), // Format giá tiền
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.shopping_cart, color: Colors.blue) ,
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Text(
                        '$reviews đánh giá',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.star, color: Colors.amber, size: 16),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
