import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safesavings/blocs/auth/auth_bloc.dart';
import 'package:safesavings/blocs/transaction/transaction_bloc.dart';
import 'package:safesavings/presentation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => TransactionBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SafeSavings',
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/main': (context) => const MainPage(),
          '/transaction-add': (context) => const TransactionAddPage(),
          '/transaction-all': (context) => const TransactionAllPage(),
        },
      ),
    );
  }
}
