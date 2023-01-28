import 'package:first_flutter_app/features/album/domain/repository/album_repo.dart';
import 'package:first_flutter_app/features/album/entity/album.dart';
import 'package:first_flutter_app/shared/domain/usecase/base_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';
import 'package:first_flutter_app/shared/vo/error.dart';

@injectable
class GetAlbumListUseCase extends BaseUseCase<Result<List<Album>, Error>> {
  final AlbumRepository _albumRepository;

  GetAlbumListUseCase(this._albumRepository);

  @override
  Stream<Result<List<Album>, Error>> invoke() => _albumRepository.getAlbumList();
}
