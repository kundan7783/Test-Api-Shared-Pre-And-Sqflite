class CartsModel {
  int? userId;
  String? date;
  List<Products>? products;

  CartsModel({this.userId, this.date, this.products});

  factory CartsModel.fromJson(Map<String, dynamic> json) {
    var list = json["products"] as List? ?? [];
    List<Products> product = list.map((e) => Products.fromJson(e)).toList();

    return CartsModel(
      userId: json["userId"],
      date: json["date"],
      products: product,
    );
  }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      productId: json["productId"],
      quantity: json["quantity"],
    );
  }
}
