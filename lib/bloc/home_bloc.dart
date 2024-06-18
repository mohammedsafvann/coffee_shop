import 'dart:async';

import '../models/items_response_model.dart';
import '../models/state.dart';
import '../resources/repository/repository.dart';
import 'base_bloc.dart';

class HomeBloc extends Object implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();
  StreamController<List<ItemsResponseModel>> _homeData =
      new StreamController<List<ItemsResponseModel>>.broadcast();

  Stream<bool> get loadingListener => _loading.stream;

  Stream<List<ItemsResponseModel>> get itemsResponseModel => _homeData.stream;

  StreamSink<bool> get loadingSink => _loading.sink;
  StreamSink<List<ItemsResponseModel>> get orderResponseModelSink =>
      _homeData.sink;

  getAllItems() async {
    loadingSink.add(true);

    State? state = await Repository().getAllData();

    if (state is SuccessState) {
      loadingSink.add(false);
      _homeData.sink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      _homeData.sink.addError("error");
    }
  }

  @override
  void dispose() {
    _loading.sink.close();
    _homeData.sink.close();

    // TODO: implement dispose
  }
}
