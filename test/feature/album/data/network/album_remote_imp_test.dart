import 'package:first_flutter_app/features/album/data/network/album_remote_imp.dart';
import 'package:first_flutter_app/features/album/data/network/model/album_model.dart';
import 'package:first_flutter_app/features/album/data/network/service/album_apis.dart';
import 'package:first_flutter_app/features/album/entity/album.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'album_remote_imp_test.mocks.dart';

@GenerateMocks([AlbumAPIs])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final api = MockAlbumAPIs();
      final remote = AlbumRemoteImp(api);

      when(api.fetchAlbum(any)).thenAnswer((_) async =>
          Future.value(const AlbumModel(id: 1, userId: 1, title: "test")));

      var result = remote.fetchAlbum(1);

      const expectedResult = Album(id: 1, userId: 1, title: "test");

      result.listen(expectAsync1((event) {
        expect(event.isSuccess, true);
        expect(event.value, isA<Album>());
        expect(event.value.id, equals(expectedResult.id));
        expect(event.value.userId, equals(expectedResult.userId));
        expect(event.value.title, equals(expectedResult.title));

        verify(api.fetchAlbum(1));
      }));
    });
    test('returns an Error if the http call failed', () async {
      final api = MockAlbumAPIs();
      final remote = AlbumRemoteImp(api);

      when(api.fetchAlbum(any)).thenThrow(Exception());

      var result = remote.fetchAlbum(1);

      result.listen(expectAsync1((event) {
        expect(event.isFailure, true);
        expect(event.error.message, equals("error"));

        verify(api.fetchAlbum(1));
      }));
    });
  });
}
