import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/features/shop/domain/entities/merchant.dart';
import 'package:merchant_app/features/shop/domain/usecases/get_merchant.dart';

class LoginState {
  final bool loading;
  final String? error;
  final Merchant? merchant;

  LoginState({this.loading = false, this.error, this.merchant});

  LoginState copyWith({bool? loading, String? error, Merchant? merchant}) {
    return LoginState(
      loading: loading ?? this.loading,
      error: error,
      merchant: merchant ?? this.merchant,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  final LoginMerchant loginMerchant;

  LoginCubit(this.loginMerchant) : super(LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true));
    try {
      final merchant = await loginMerchant(email, password);
      emit(state.copyWith(merchant: merchant, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
