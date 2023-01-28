import 'package:first_flutter_app/features/album/domain/usecase/get_album_list_use_case.dart';
import 'package:first_flutter_app/features/album/entity/album.dart';
import 'package:first_flutter_app/shared/presentation/base_view_model.dart';
import 'package:first_flutter_app/shared/presentation/extensions/extensions.dart';
import 'package:first_flutter_app/shared/service/navigation_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AlbumListViewModel extends BaseViewModel {
  final GetAlbumListUseCase _getAlbumListUseCase;
  final NavigationService _navigator;

  late Stream<bool> loading;
  late Stream<List<Album>> albumList;

  AlbumListViewModel(this._getAlbumListUseCase, this._navigator) {
    _init();
  }

  void _init() {
    loading = _getAlbumListUseCase.result.map((event) => false);
    albumList = _getAlbumListUseCase.result.mapSuccess((event) => event);
  }

  void onScreenStarted(){
    _getAlbumListUseCase.execute();
  }

  void onItemClicked(int id) {
    _navigator.toDetails(id);
  }
}
