import 'dart:async';

import 'package:first_flutter_app/features/album/domain/repository/album_repo.dart';
import 'package:first_flutter_app/features/album/entity/album.dart';
import 'package:first_flutter_app/shared/domain/usecase/base_use_case.dart';
import 'package:first_flutter_app/shared/vo/error.dart';
import 'package:injectable/injectable.dart';
import 'package:result_monad/result_monad.dart';

@injectable
class GetAlbumDetailsUseCase
    extends BaseUseCaseParam<int, Result<Album, Error>> {
  final AlbumRepository _albumRepository;

  GetAlbumDetailsUseCase(this._albumRepository);

  @override
  Stream<Result<Album, Error>> invoke(int params) =>
      _albumRepository.getAlbum(params);
}
