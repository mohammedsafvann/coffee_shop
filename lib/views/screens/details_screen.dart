import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/utils/constants.dart';
import 'package:coffee/utils/shared_preference.dart';
import 'package:coffee/utils/utils.dart';
import 'package:coffee/views/screens/home_screen.dart';
import 'package:coffee/views/screens/cart_screen.dart';
import 'package:coffee/views/widget/build_common_button_widget.dart';
import 'package:coffee/views/widget/build_text_widget.dart';
import 'package:flutter/material.dart';

import '../widget/home_menu.dart';

class DetailsScreen extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String discription;
  final String id;
  const DetailsScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      required this.discription,
      required this.id});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String? userUid;
  getCartData() async {
    userUid = await SharedPreferenceHelper.getStringValue();
  }

  @override
  void initState() {
    getCartData();
    // TODO: implement initState
    super.initState();
  }

  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            push(context, HomeMenu());
          },
          icon:
              Icon(Icons.arrow_back_rounded, color: Constants.kitGradients[0]),
        ),
        backgroundColor: Constants.kitGradients[1],
        title:
            BuildTextWidget(text: "Details", color: Constants.kitGradients[3]),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        color: Constants.kitGradients[1],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: screenWidth(context, dividedBy: 1.5),
                  height: screenHeight(context, dividedBy: 2.3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BuildTextWidget(
                      text: widget.name.toUpperCase(),
                      color: Constants.kitGradients[0],
                      fontWeight: FontWeight.w500,
                      size: 20,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_outline_rounded,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: BuildTextWidget(
                    text: widget.discription,
                    color: Constants.kitGradients[3].withOpacity(.7),
                    fontWeight: FontWeight.w500,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildTextWidget(
                      text: "₹ ${widget.price}",
                      color: Constants.kitGradients[3],
                      size: 20),
                  BuildCommonButtonWidget(
                      onPress: () async {
                        QuerySnapshot querySnapshot = await FirebaseFirestore
                            .instance
                            .collection("myCart")
                            .where("uid", isEqualTo: userUid)
                            .where("id", isEqualTo: widget.id)
                            .get();
                        if (querySnapshot.docs.isEmpty) {
                          FirebaseFirestore.instance.collection("myCart").add({
                            "uid": userUid,
                            "image": widget.image,
                            "itemName": widget.name,
                            "price": widget.price,
                            "id": widget.id,
                            "quantity": "1"
                          }).then((value) {
                            FirebaseFirestore.instance
                                .collection("myCart")
                                .doc(value.id)
                                .update({"docId": value.id});
                          });
                        }

                        await pushAndReplacement(context, CartScreen());
                      },
                      buttonName: " Add to Cart",
                      buttonWidth: screenWidth(context, dividedBy: 1.5),
                      buttonHeight: 55),
                ],
              )
              // ReviewsList(),
            ],
          ),
        ),
      ),
    );
  }
}
