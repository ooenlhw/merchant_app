import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/shop/domain/entities/product.dart';
import 'package:merchant_app/features/shop/domain/usecases/get_product.dart';

class ProductState {
  final List<Product> products;
  final bool loading;
  final String? error;

  ProductState({this.products = const [], this.loading = false, this.error});

  ProductState copyWith({List<Product>? products, bool? loading, String? error}) {
    return ProductState(
      products: products ?? this.products,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class ProductCubit extends Cubit<ProductState> {
  final GetProducts getProducts;

  ProductCubit(this.getProducts) : super(ProductState());

  Future<void> loadProducts() async {
    emit(state.copyWith(loading: true));
    try {
      final products = await getProducts();
      emit(state.copyWith(products: products, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
