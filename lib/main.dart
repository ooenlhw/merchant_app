// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merchant_app/core/di/service_locator.dart';
import 'package:merchant_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:merchant_app/features/search/presentation/pages/search_page.dart';
import 'package:merchant_app/features/shop/presentation/bloc/merchant_bloc.dart';
import 'package:merchant_app/features/shop/presentation/bloc/product_bloc.dart';
import 'package:merchant_app/features/shop/presentation/pages/login_page.dart';
import 'package:merchant_app/features/shop/presentation/pages/product_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures async setup
  await setupLocator(); // Wait for GetIt setup before running the app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LoginCubit>()),
        BlocProvider(create: (_) => sl<ProductCubit>()),
        BlocProvider(create: (_) => sl<SearchBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Merchant App',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/',
        routes: {
          // '/': (context) => SearchPage(),
          '/': (context) => LoginPage(),
          '/product-list': (context) => ProductListPage(),
        },
      ),
    );
  }
}
