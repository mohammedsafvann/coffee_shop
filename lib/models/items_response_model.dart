// To parse this JSON data, do
//
//     final itemsResponseModel = itemsResponseModelFromJson(jsonString);

import 'dart:convert';

ItemsResponseModel itemsResponseModelFromJson(String str) =>
    ItemsResponseModel.fromJson(json.decode(str));

String itemsResponseModelToJson(ItemsResponseModel data) =>
    json.encode(data.toJson());

class ItemsResponseModel {
  String? image;
  String? itemName;
  int? price;
  String? discription;
  String? id;

  ItemsResponseModel({
    this.image,
    this.itemName,
    this.price,
    this.discription,
    this.id,
  });

  factory ItemsResponseModel.fromJson(Map<String, dynamic> json) =>
      ItemsResponseModel(
        image: json["image"],
        itemName: json["itemName"],
        price: json["price"],
        discription: json["discription"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "itemName": itemName,
        "price": price,
        "discription": discription,
        "id": id,
      };
}
