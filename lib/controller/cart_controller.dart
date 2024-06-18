import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/utils/shared_preference.dart';

import '../models/cart_response_model.dart';

class CartController {
  int itemCount = 0;
  double newTotal = 0;
  double subTotal = 0;
  double shippingFee = 0;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<CartResponseModel> cartItemsList = [];
  Future<double> calculateSubTotal() async {
    double subTotal = 0;

    for (int i = 0; i < cartItemsList.length; i++) {
      subTotal += int.parse(cartItemsList[i].price!.toString()) *
          int.parse(cartItemsList[i].quantity.toString());
    }
    return subTotal;
  }

  double addTotal({
    required double subTotal,
    required double shippingFee,
  }) {
    double total = 0;
    total = subTotal + shippingFee;
    return total;
  }

  Future<List<CartResponseModel>> getMyCartData() async {
    try {
      String? userUid = await SharedPreferenceHelper.getStringValue();
      print("userUid...................");
      print(userUid);
      QuerySnapshot querySnapshot = await _db
          .collection("myCart")
          .where("uid", isEqualTo: userUid.toString())
          .get();

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        CartResponseModel cartResponseModel =
            CartResponseModel.fromJson(doc.data() as Map<String, dynamic>);

        cartItemsList.add(cartResponseModel);
      }
      return cartItemsList;
    } catch (e) {
      print('Error fetching data: $e');
      return cartItemsList;
    }
  }

  deleteCartItem({required String docId}) async {
    print("safvan..........");
    print(docId);

    await _db.collection("myCart").doc(docId).delete();
  }
}
