import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/items_response_model.dart';
import '../../models/order_response_model.dart';
import '../../models/state.dart';
import '../../utils/shared_preference.dart';

class FireBaseProvider {
  String? userUid;
  List<OrderResponseModel> orderItemList = [];
  List<ItemsResponseModel> allItemList = [];
  Future<String?> getUserUid() async {
    return userUid = await SharedPreferenceHelper.getStringValue();
  }

  Future<State?> getData() async {
    String? uid = await getUserUid();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("myOrder")
        .where("uid", isEqualTo: uid)
        .get();
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      OrderResponseModel orderResponseModel =
          OrderResponseModel.fromJson(doc.data() as Map<String, dynamic>);
      orderItemList.add(orderResponseModel);
    }
    if (orderItemList.isNotEmpty) {
      return State.success(orderItemList);
    } else {
      return State.error("error");
    }
  }

  Future<State?> getAllData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("items").get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      ItemsResponseModel itemsResponseModel =
          ItemsResponseModel.fromJson(doc.data() as Map<String, dynamic>);

      allItemList.add(itemsResponseModel);
    }
    if (allItemList.isNotEmpty) {
      return State.success(allItemList);
    } else {
      return State.error("error");
    }
  }
}
