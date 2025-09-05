import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_webapp/app/pages/home/home_page.dart';


class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),

    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('Página não encontrada!'),
      ),
    ),
  );
}