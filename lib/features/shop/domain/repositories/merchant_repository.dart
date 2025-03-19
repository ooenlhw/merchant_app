import 'package:merchant_app/features/shop/domain/entities/merchant.dart';

abstract class MerchantRepository {
  Future<Merchant> login(String email, String password);
  Future<Merchant> signup(String name, String email, String password);
}
