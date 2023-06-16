

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../page/movie_details/movie_details_page.dart';
import '../../page/splash/splash_page.dart';
import '../../page/home/home_page.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
    AutoRoute(page: MovieDetailsRoute.page, path: '/movie_details'),
  ];
}
