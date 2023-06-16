

import 'package:flutter/material.dart';

import 'framework/locator/inject_container.dart';
import 'framework/router/app_router.dart';

class MyApp extends StatelessWidget {
  final _appRouter = locator<AppRouter>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildApp(context);
  }

  Widget _buildApp(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo Movies',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
