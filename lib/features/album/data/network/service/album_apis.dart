import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../model/album_model.dart';

part 'album_apis.g.dart';

@injectable
@RestApi()
abstract class AlbumAPIs {
  @factoryMethod
  factory AlbumAPIs(Dio dio, {@Named("baseURL") String baseUrl}) = _AlbumAPIs;

  @GET("albums/{id}")
  Future<AlbumModel> fetchAlbum(@Path("id") int id);

  @GET("albums")
  Future<List<AlbumModel>> fetchAlbumList();
}
