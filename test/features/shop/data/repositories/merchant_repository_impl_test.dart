import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:merchant_app/features/shop/data/repositories/merchant_repository_impl.dart';
import 'package:merchant_app/features/shop/domain/entities/merchant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Generate Mock Class
@GenerateMocks([http.Client])
import 'merchant_repository_impl_test.mocks.dart';

void main() {
  late MerchantApiRepository repository;
  late MockClient mockClient;

  setUp(() {
    mockClient = MockClient();
    repository = MerchantApiRepository(
      'https://dummyjson.com/auth',
      client: mockClient,
    );
  });

  group('MerchantApiRepository', () {
    test('login returns Merchant on successful login', () async {
      final response = http.Response(
        json.encode({
          "accessToken": "mockAccessToken",
          "refreshToken": "mockRefreshToken",
          "id": 1,
          "username": "emilys",
          "email": "emily.johnson@x.dummyjson.com",
          "firstName": "Emily",
          "lastName": "Johnson",
          "gender": "female",
          "image": "https://dummyjson.com/icon/emilys/128"
        }),
        200,
      );

      when(mockClient.post(
        any,
        body: anyNamed('body'),
      )).thenAnswer((_) async => response);

      final merchant = await repository.login('emilys', 'emilyspass');

      expect(merchant, isA<Merchant>());
      expect(merchant.id, '1');
      expect(merchant.username, 'emilys');
      expect(merchant.email, 'emily.johnson@x.dummyjson.com');
      expect(merchant.name, 'EmilyJohnson');
      expect(merchant.gender, 'female');
      expect(merchant.image, 'https://dummyjson.com/icon/emilys/128');
    });
  });

  test('login throws Exception on failed login', () async {
    final response = http.Response('Unauthorized', 401);

    when(mockClient.post(
      any,
      body: anyNamed('body'),
    )).thenAnswer((_) async => response);

    expect(
      () async => await repository.login('en.user@gmail.com', 'edn123'),
      throwsA(isA<Exception>()),
    );
  });
}
