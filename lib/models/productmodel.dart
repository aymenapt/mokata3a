class Product {
  String productname;
  bool state;

  Product({
    required this.productname,
    required this.state,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productname: json['productname'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productname': productname,
      'state': state,
    };
  }
}
