import 'package:dio/dio.dart';

Dio dio(){
  Dio dio = new Dio();

// Set default configs
  dio.options.baseUrl = "http://10.0.2.2:8000/";
  // dio.options.headers['accept'] = '*/*';
  // dio.options.baseUrl = 'http://localhost:8000/api'; for ios machine
  ///user
//   dio.options.connectTimeout = 5000; //5s
//   dio.options.receiveTimeout = 3000;
//
// // or new Dio with a BaseOptions instance.
//   var options = BaseOptions(
//     baseUrl: 'https://www.xx.com/api',
//     connectTimeout: 5000,
//     receiveTimeout: 3000,
//   );
//   Dio dio = Dio(options);
return dio;
}