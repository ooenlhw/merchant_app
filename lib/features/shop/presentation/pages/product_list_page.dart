import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/shop/domain/usecases/get_product.dart';
import 'package:merchant_app/features/shop/presentation/bloc/product_bloc.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }
          if (state.products.isEmpty) {
            return Center(child: Text('No products available.'));
          }
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ListTile(
                title: Text(product.name),
                subtitle:
                    Text('Price: \$${product.price} | Stock: ${product.stock}'),
                onTap: () {
                  // Navigate to product details or edit page
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Product Page
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
