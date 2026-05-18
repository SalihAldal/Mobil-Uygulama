import "package:flutter/material.dart";

import "../models/product.dart";

class CartController extends ChangeNotifier {
  final Map<int, Product> _items = <int, Product>{};

  List<Product> get items => _items.values.toList();

  int get count => _items.length;

  bool contains(int id) => _items.containsKey(id);

  void add(Product product) {
    _items[product.id] = product;
    notifyListeners();
  }

  void remove(Product product) {
    if (_items.remove(product.id) != null) {
      notifyListeners();
    }
  }

  void toggle(Product product) {
    if (contains(product.id)) {
      remove(product);
    } else {
      add(product);
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class CartScope extends InheritedNotifier<CartController> {
  const CartScope({
    super.key,
    required CartController controller,
    required Widget child,
  }) : super(notifier: controller, child: child);

  static CartController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<CartScope>();
    if (scope?.notifier == null) {
      throw FlutterError("CartScope bulunamadi.");
    }
    return scope!.notifier!;
  }
}
