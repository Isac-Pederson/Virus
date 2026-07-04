import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:virus/ui/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(path: "/" ,builder:(context, state) => const LoginView())
]

);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MaterialApp.router(routerConfig: _router)
    );
  }
}


