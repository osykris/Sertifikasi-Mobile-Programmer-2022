class ProductModel {
  late String name,
      image,
      description,
      benefits,
      compotition,
      method,
      price,
      productId;

  ProductModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.benefits,
      required this.compotition,
      required this.method,
      required this.price,
      required this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    description = map['description'];
    benefits = map['benefits'];
    compotition = map['compotition'];
    method = map['method'];
    price = map['price'];
    productId = map['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'benefits': benefits,
      'compotition': compotition,
      'method': method,
      'price': price,
      'productId': productId,
    };
  }
}