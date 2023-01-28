import 'package:first_flutter_app/features/album/presentation/album_list_view_model.dart';
import 'package:first_flutter_app/shared/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/presentation/extensions/extensions.dart';

class AlbumListScreen extends ViewModelBuilderWidget<AlbumListViewModel> {

  @override
  void onViewModelReady(AlbumListViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.onScreenStarted();
  }

  @override
  Widget builder(
      BuildContext context, AlbumListViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsRes.albumList),
      ),
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
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
          viewModel.albumList.toWidget(
              initialData: [],
              widgetBuilder: (data) {
                return ListView.separated(
                    separatorBuilder: (context, index) => Divider(color: Colors.black),
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      final item = data[index]; // for example
                      return GestureDetector(
                        child: ListTile(title: Text(item.title)),
                        onTap: () {
                          viewModel.onItemClicked(item.id);
                        },
                      );
                    });
              }),
        ],
      ),
    );
  }

  @override
  AlbumListViewModel viewModelBuilder(BuildContext context) {
    return GetIt.I.get<AlbumListViewModel>();
  }
}
