import 'package:first_flutter_app/shared/router/router.gr.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NavigationModule {
  @lazySingleton
  AppRouter get router => AppRouter();

}