import 'package:flutter/material.dart';

import '../models/items_model.dart';

class Constants {
  static final rupeeSymbol = "\u20B9";
  static const String FEATURE_NOT_AVAILABLE = "Feature not available";
  static const String BOX_NAME = "app";
  static const String SOMETHING_WENT_WRONG = "Oops! something went wrong";

  ///gradients
  static List<Color> kitGradients = [
    Colors.white, //0
    Colors.black, //1
    Colors.transparent, //2
    Color(0xffFFFAE7), //3searchbar
    Color(0xffF2F2F2), //4chipcolor
    Color(0xffFFFFFF), //5price
    const Color(0xffFFFAE7), //6
    Colors.white10, //7
    const Color(0xff101010), //8
    const Color(0xff030303), //9
    const Color(0xff27AE60), //10
    const Color(0xffd7b100), //11
    const Color(0xffDB0000), //12
    const Color(0xff009f12), //13
    const Color(0xff08009b), //14
    const Color(0xff2b2b2b), //15
    const Color(0xff181818), //16
    const Color(0xff1C1C1C), //17
    Colors.white12, //18
  ];
  static List<ItemModel> coffeeList = [
    ItemModel(
      quantity: 1,
      image: "assets/images/Image_bg.png",
      name: "cofee 1",
      price: 99,
      discription: "sdhjdjdksajdlksdaldkal",
    ),
    ItemModel(
        quantity: 1,
        image: "assets/images/Image_bg.png",
        name: "cofee 1",
        price: 99,
        discription: "sdhjdjdksajdlksdaldkal"),
    ItemModel(
        quantity: 1,
        image: "assets/images/Image_bg.png",
        name: "cofee 3",
        price: 99,
        discription: "sdhjdjdksajdlksdaldkal"),
    ItemModel(
        quantity: 1,
        image: "assets/images/Image_bg.png",
        name: "cofee 4",
        price: 99,
        discription: "sdhjdjdksajdlksdaldkal"),
    ItemModel(
        quantity: 1,
        image: "assets/images/Image_bg.png",
        name: "cofee 5",
        price: 99,
        discription: "sdhjdjdksajdlksdaldkal"),
  ];
}
