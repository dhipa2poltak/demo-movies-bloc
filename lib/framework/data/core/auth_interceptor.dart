

import 'package:demo_movies/data/constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> map = {"Authorization": "Bearer ${Constants.VALUE_ACCESS_TOKEN}"};
    options.headers.addAll(map);

    return super.onRequest(options, handler);
  }
}
