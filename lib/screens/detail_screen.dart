import "package:flutter/material.dart";

import "../models/product.dart";
import "../state/cart_controller.dart";

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});

  static const routeName = "/detail";

  final Product product;

  @override
  Widget build(BuildContext context) {
    final cart = CartScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Urun Detayi"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            product.category.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 6),
          Text(
            product.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            product.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Fiyat",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  "${product.price.toStringAsFixed(0)} TL",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFFF7A00),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () {
              cart.add(product);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Sepete eklendi.")),
              );
            },
            icon: const Icon(Icons.shopping_bag_outlined),
            label: const Text("Sepete Ekle"),
          ),
        ],
      ),
    );
  }
}
