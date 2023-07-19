import 'package:flutter/material.dart';
import 'package:wheelsndeels/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
