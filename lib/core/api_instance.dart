import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

Dio getApiClient() {
  final Dio dio = Dio();
  final GetStorage box = GetStorage();

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers['Authorization'] = 'Bearer ${box.read('token')}';
      // options.headers['Content-Type'] = 'application/json';
      options.headers['Accept'] = 'application/json';
      return handler.next(options);
    },
  ));

  return dio;
}
