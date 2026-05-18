import "dart:convert";

import "package:flutter/services.dart";

import "../models/product.dart";

class ProductRepository {
  Future<List<Product>> loadProducts() async {
    final raw = await rootBundle.loadString("assets/data/products.json");
    final json = jsonDecode(raw) as Map<String, dynamic>;
    final items = json["products"] as List<dynamic>;
    return items
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
