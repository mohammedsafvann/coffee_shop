// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

OrderResponseModel orderResponseModelFromJson(String str) =>
    OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) =>
    json.encode(data.toJson());

class OrderResponseModel {
  String? image;
  String? itemName;
  String? price;
  String? id;
  String? uid;
  String? quantity;
  String? date;

  OrderResponseModel({
    this.image,
    this.itemName,
    this.price,
    this.id,
    this.uid,
    this.quantity,
    this.date,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        image: json["image"],
        itemName: json["itemName"],
        price: json["price"],
        id: json["id"],
        uid: json["uid"],
        quantity: json["quantity"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "itemName": itemName,
        "price": price,
        "id": id,
        "uid": uid,
        "quantity": quantity,
        "date": date,
      };
}
