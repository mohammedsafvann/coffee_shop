import 'dart:async';

import '../models/order_response_model.dart';
import '../models/state.dart';
import '../resources/repository/repository.dart';
import 'base_bloc.dart';

class OrderBloc extends Object implements BaseBloc {
  StreamController<bool> _loading = new StreamController<bool>.broadcast();
  StreamController<List<OrderResponseModel>> _myOrder =
      new StreamController<List<OrderResponseModel>>.broadcast();

  Stream<bool> get loadingListener => _loading.stream;

  Stream<List<OrderResponseModel>> get orderResponseModelStream =>
      _myOrder.stream;
  StreamSink<bool> get loadingSink => _loading.sink;
  StreamSink<List<OrderResponseModel>> get orderResponseModelSink =>
      _myOrder.sink;

  getMyOrderItems() async {
    loadingSink.add(true);

    State? state = await Repository().getData();

    if (state is SuccessState) {
      loadingSink.add(false);
      _myOrder.sink.add(state.value);
    } else if (state is ErrorState) {
      loadingSink.add(false);
      _myOrder.sink.addError("error");
    }
  }

  @override
  void dispose() {
    _loading.sink.close();
    _myOrder.sink.close();

    // TODO: implement dispose
  }
}
