import 'package:auto_route/auto_route.dart';
import 'package:first_flutter_app/features/album/ui/album_details_screen.dart';
import 'package:first_flutter_app/features/album/ui/album_list_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  MaterialRoute(page: AlbumListScreen, initial: true),
  MaterialRoute(page: AlbumDetailsScreen),
])
class $AppRouter {}
