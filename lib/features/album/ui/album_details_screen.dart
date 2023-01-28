import 'package:first_flutter_app/features/album/presentation/album_details_view_model.dart';
import 'package:first_flutter_app/shared/presentation/extensions/extensions.dart';
import 'package:first_flutter_app/shared/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class AlbumDetailsScreen extends ViewModelBuilderWidget<AlbumDetailsViewModel> {
  final int _id;

  const AlbumDetailsScreen(this._id);

  @override
  void onViewModelReady(AlbumDetailsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onScreenStarted(_id);
  }

  @override
  Widget builder(
      BuildContext context, AlbumDetailsViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsRes.albumDetails),
      ),
      body: Stack(
        children: [
          Center(
            child: viewModel.loading.toWidget(
                initialData: true,
                widgetBuilder: (loading) {
                  return Visibility(
                    child: const CircularProgressIndicator(),
                    visible: loading,
                  );
                }),
          ),
          Center(
            child: viewModel.albumTitle.toWidget(
                initialData: "",
                widgetBuilder: (title) {
                  return Text(title);
                }),
          )
        ],
      ),
    );
  }

  @override
  AlbumDetailsViewModel viewModelBuilder(BuildContext context) {
    return GetIt.I.get<AlbumDetailsViewModel>();
  }
}
