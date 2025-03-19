// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:merchant_app/features/shop/domain/entities/merchant.dart';
// import 'package:merchant_app/features/shop/presentation/pages/login_page.dart';
// import 'package:merchant_app/features/shop/presentation/bloc/merchant_bloc.dart';

// void main() {
//   group('LoginPage Tests', () {
//     late LoginCubit loginCubit;

//     setUp(() {
//       loginCubit = LoginCubit();
//     });

//     tearDown(() {
//       loginCubit.close();
//     });

//     testWidgets('should display email and password text fields', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       expect(find.byType(TextField), findsNWidgets(2));
//       expect(find.byType(ElevatedButton), findsOneWidget);
//     });

//     testWidgets('should display login button', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       expect(find.text('Login'), findsOneWidget);
//     });

//     testWidgets('should allow entering text in email and password fields', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
//       await tester.enterText(find.byType(TextField).at(1), 'password123');

//       expect(find.text('test@example.com'), findsOneWidget);
//       expect(find.text('password123'), findsOneWidget);
//     });

//     testWidgets('should show loading indicator when login button is pressed', (WidgetTester tester) async {
//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
//       await tester.enterText(find.byType(TextField).at(1), 'password123');
//       await tester.tap(find.byType(ElevatedButton));
//       await tester.pump();

//       expect(find.byType(CircularProgressIndicator), findsOneWidget);
//     });

//     testWidgets('should show error message when login fails', (WidgetTester tester) async {
//       loginCubit.emit(LoginState(error: 'Login failed'));

//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       await tester.pump(); // Rebuild widget to show SnackBar

//       expect(find.text('Login failed'), findsOneWidget);
//     });

//     testWidgets('should navigate to product list on successful login', (WidgetTester tester) async {
//       loginCubit.emit(LoginState(merchant: Merchant(id: 0, name: '', email: '', token: '')));

//       await tester.pumpWidget(
//         MaterialApp(
//           home: BlocProvider<LoginCubit>(
//             create: (_) => loginCubit,
//             child: LoginPage(),
//           ),
//         ),
//       );

//       await tester.pumpAndSettle(); // Wait for navigation

//       expect(find.byType(LoginPage), findsNothing);
//     });
//   });
// }