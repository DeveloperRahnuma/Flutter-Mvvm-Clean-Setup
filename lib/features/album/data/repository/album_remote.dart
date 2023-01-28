import 'package:result_monad/result_monad.dart';
import 'package:first_flutter_app/shared/vo/error.dart';

import '../../entity/album.dart';

abstract class AlbumRemote {
  Stream<Result<Album,Error>> fetchAlbum(int id);
  Stream<Result<List<Album>, Error>> fetchAlbumList();
}
