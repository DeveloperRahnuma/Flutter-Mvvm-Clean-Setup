import 'package:first_flutter_app/features/album/data/repository/album_remote.dart';
import 'package:first_flutter_app/features/album/domain/repository/album_repo.dart';
import 'package:first_flutter_app/shared/vo/error.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

import '../../entity/album.dart';

@Injectable(as: AlbumRepository)
class AlbumRepositoryImp implements AlbumRepository {
  final AlbumRemote _remoteSource;

  AlbumRepositoryImp(this._remoteSource);

  @override
  Stream<Result<Album,Error>> getAlbum(int id) => _remoteSource.fetchAlbum(id);

  @override
  Stream<Result<List<Album>, Error>> getAlbumList() =>
      _remoteSource.fetchAlbumList();
}
