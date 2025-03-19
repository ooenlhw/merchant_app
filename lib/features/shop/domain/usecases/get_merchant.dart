import 'package:merchant_app/features/shop/domain/entities/merchant.dart';
import 'package:merchant_app/features/shop/domain/repositories/merchant_repository.dart';

class LoginMerchant {
  final MerchantRepository repository;

  LoginMerchant(this.repository);

  Future<Merchant> call(String email, String password) async {
    return await repository.login(email, password);
  }
}

class SignupMerchant {
  final MerchantRepository repository;

  SignupMerchant(this.repository);

  Future<Merchant> call(String name, String email, String password) async {
    return await repository.signup(name, email, password);
  }
}
