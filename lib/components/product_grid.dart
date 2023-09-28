import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/product.dart';
import '../models/product_list.dart';
import 'product_grid_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  const ProductsGrid(this.showFavoriteOnly, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Product> loudProducts =showFavoriteOnly ? provider.favoriteItems : provider.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: loudProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loudProducts[i],
        child: const ProductGridItem(),
      ),
    );
  }
}
