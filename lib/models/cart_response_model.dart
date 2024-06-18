// To parse this JSON data, do
//
//     final cartResponseModel = cartResponseModelFromJson(jsonString);

import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) =>
    CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) =>
    json.encode(data.toJson());

class CartResponseModel {
  String? image;
  String? itemName;
  String? price;
  String? discrption;
  String? id;
  String? docId;
  String? uid;
  String? quantity;

  CartResponseModel({
    this.image,
    this.itemName,
    this.price,
    this.discrption,
    this.id,
    this.uid,
    this.docId,
    this.quantity,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      CartResponseModel(
        image: json["image"],
        itemName: json["itemName"],
        price: json["price"],
        discrption: json["discrption"],
        id: json["id"],
        uid: json["uid"],
        docId: json["docId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "itemName": itemName,
        "price": price,
        "discrption": discrption,
        "id": id,
        "uid": uid,
        "docId": docId,
        "quantity": quantity,
      };
}
