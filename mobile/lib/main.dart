import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:virus/ui/themes/app_theme.dart';
import 'package:virus/ui/view/login_view.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
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
      theme: AppTheme.theme,
      home: MaterialApp.router(routerConfig: _router)
    );
  }
}


