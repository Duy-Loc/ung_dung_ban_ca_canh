class FishModel {
  int? id;
  String? productName;
  double? price;
  String? description;
  int? stockQuantity;
  bool? isVisible;
  String? createdAt;
  List<ProductImages>? productImages;

  FishModel(
      {this.id,
      this.productName,
      this.price,
      this.description,
      this.stockQuantity,
      this.isVisible,
      this.createdAt,
      this.productImages});

  FishModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    price = json['price'];
    description = json['description'];
    stockQuantity = json['stockQuantity'];
    isVisible = json['isVisible'];
    createdAt = json['createdAt'];
    if (json['productImages'] != null) {
      productImages = <ProductImages>[];
      json['productImages'].forEach((v) {
        productImages!.add( ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['price'] = price;
    data['description'] = description;
    data['stockQuantity'] = stockQuantity;
    data['isVisible'] = isVisible;
    data['createdAt'] = createdAt;
    if (productImages != null) {
      data['productImages'] =
          productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  int? id;
  String? imageUrl;
  int? productId;

  ProductImages({this.id, this.imageUrl, this.productId});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    data['productId'] = productId;
    return data;
  }
}
