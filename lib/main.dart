import "package:flutter/material.dart";

import "screens/home_screen.dart";
import "screens/detail_screen.dart";
import "screens/cart_screen.dart";
import "models/product.dart";
import "state/cart_controller.dart";

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatefulWidget {
  const MiniKatalogApp({super.key});

  @override
  State<MiniKatalogApp> createState() => _MiniKatalogAppState();
}

class _MiniKatalogAppState extends State<MiniKatalogApp> {
  final CartController _cartController = CartController();

  @override
  void dispose() {
    _cartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartScope(
      controller: _cartController,
      child: MaterialApp(
        title: "Mini Katalog",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFFFF7A00),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        initialRoute: "/",
        onGenerateRoute: (settings) {
          if (settings.name == DetailScreen.routeName) {
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (context) => DetailScreen(product: product),
            );
          }
          if (settings.name == CartScreen.routeName) {
            return MaterialPageRoute(
              builder: (context) => const CartScreen(),
            );
          }
          return MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          );
        },
      ),
    );
  }
}
