import '../../models/state.dart';
import '../firebase_provider/firebase_provider.dart';

class Repository {
  Future<State?> getData() => FireBaseProvider().getData();

  Future<State?> getAllData() => FireBaseProvider().getAllData();
}
