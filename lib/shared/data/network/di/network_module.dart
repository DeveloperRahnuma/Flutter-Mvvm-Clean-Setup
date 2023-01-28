import 'package:dio/dio.dart';
import 'package:first_flutter_app/shared/data/network/network_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.instance;

@module
abstract class NetworkModule {
  @lazySingleton
  PrettyDioLogger get dioLoggingInterceptor => PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true);

  @lazySingleton
  Map<String, String> get headers => NetworkConstants.headers;

  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(dioLoggingInterceptor)
    ..options.headers = headers;

  @Named("baseURL")
  @injectable
  String get baseURL => NetworkConstants.baseURL;
}
