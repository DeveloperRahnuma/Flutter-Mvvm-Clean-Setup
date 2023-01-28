import 'package:injectable/injectable.dart';

import '../router/router.gr.dart';

abstract class NavigationService {
  void toDetails(int id);
}

@Singleton(as: NavigationService)
class NavigationServiceImp implements NavigationService {
  final AppRouter _appRouter;

  NavigationServiceImp(this._appRouter);

  @override
  void toDetails(int id) {
    _appRouter.push(AlbumDetailsScreen(id: id));
  }
}
