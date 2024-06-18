import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/controller/cart_controller.dart';
import 'package:coffee/views/screens/my_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/cart_response_model.dart';
import '../../utils/constants.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';
import '../widget/build_cart_items_widget.dart';
import '../widget/build_cart_row_widget.dart';
import '../widget/build_common_button_widget.dart';
import '../widget/build_text_widget.dart';
import '../widget/home_menu.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  late double newTotal;
  // double newTotal = 0;
  double subTotal = 0;
  bool isLoading = true;
  CartController cartController = CartController();
  List<CartResponseModel> cartItemsList = [];
  String? formattedDate;

  getData() async {
    cartItemsList = await cartController.getMyCartData();
    newTotal = await cartController.calculateSubTotal();
    DateTime currentDate = DateTime.now();
    formattedDate = DateFormat('d MMM yyyy').format(currentDate);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        pushAndReplacement(context, const HomeMenu());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.kitGradients[9],
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              pushAndReplacement(context, HomeMenu());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Constants.kitGradients[0],
            ),
          ),
          title: BuildTextWidget(
            text: 'My Cart',
            color: Constants.kitGradients[0],
            fontWeight: FontWeight.w600,
            size: 22,
          ),
        ),
        backgroundColor: Constants.kitGradients[9],
        body: isLoading
            ? Center(
                child:
                    CircularProgressIndicator(color: Constants.kitGradients[0]),
              )
            : cartItemsList.isEmpty
                ? Center(
                    child: BuildTextWidget(
                        fontWeight: FontWeight.w500,
                        size: 18,
                        text: "Your cart is empty!",
                        color: Constants.kitGradients[0]),
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    height: screenHeight(
                      context,
                    ),
                    width: screenWidth(context),
                    child: Container(
                      height: screenHeight(context, dividedBy: 1.3),
                      width: screenWidth(context),
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cartItemsList.length,
                                itemBuilder: (context, index) {
                                  return BuildCartItemsWidget(
                                      onTap: () {
                                        {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.zero)),
                                                title: Text('Remove From Cart'),
                                                content: Text(
                                                    'Do you want to Remove This item From The Cart ?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        cartController
                                                            .deleteCartItem(
                                                                docId: cartItemsList[
                                                                        index]
                                                                    .docId
                                                                    .toString());
                                                      });
                                                      pushAndReplacement(
                                                        context,
                                                        const CartScreen(),
                                                      );
                                                    },
                                                    child: Text('Remove'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                        ;
                                      },
                                      productId:
                                          cartItemsList[index].docId.toString(),
                                      productName: cartItemsList[index]
                                          .itemName
                                          .toString(),
                                      price:
                                          cartItemsList[index].price.toString(),
                                      networkImage:
                                          cartItemsList[index].image.toString(),
                                      count: int.parse(cartItemsList[index]
                                          .quantity
                                          .toString()),
                                      add: (p0) {
                                        setState(() {
                                          newTotal = newTotal +
                                              int.parse(cartItemsList[index]
                                                  .price
                                                  .toString());
                                        });
                                      },
                                      sub: (p0) {
                                        setState(() {
                                          newTotal = newTotal -
                                              int.parse(cartItemsList[index]
                                                  .price
                                                  .toString());
                                        });
                                      },
                                      itemCount: (value) {
                                        setState(() {
                                          cartItemsList[index].quantity =
                                              value.toString();
                                        });
                                        setState(() {
                                          FirebaseFirestore.instance
                                              .collection("myCart")
                                              .doc(cartItemsList[index].docId)
                                              .update({
                                            "quantity": value.toString()
                                          });
                                        });
                                      },
                                      onTapBackToDetails: () {});
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            BuildCartRowWidget(
                              infoText: "Sub-total",
                              resultText: newTotal.toString(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const BuildCartRowWidget(
                              infoText: "Tax",
                              // resultText: shippingFee.toString(),
                              resultText: "12",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              height: 1,
                              width: screenWidth(context, dividedBy: 1.05),
                              color: Constants.kitGradients[5].withOpacity(.2),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                BuildTextWidget(
                                  text: "Total",
                                  color: Constants.kitGradients[0],
                                  fontFamily: "Helvetica.ttf",
                                  fontWeight: FontWeight.w700,
                                  size: 16,
                                ),
                                const Spacer(),
                                BuildTextWidget(
                                  text: "INR  ${newTotal + 12}",
                                  color: Constants.kitGradients[0],
                                  fontFamily: "Helvetica.ttf",
                                  fontWeight: FontWeight.w700,
                                  size: 16,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BuildCommonButtonWidget(
                              onPress: () async {
                                for (int i = 0; i < cartItemsList.length; i++) {
                                  await FirebaseFirestore.instance
                                      .collection("myOrder")
                                      .add({
                                    "id": cartItemsList[i].id,
                                    "image": cartItemsList[i].image,
                                    "itemName": cartItemsList[i].itemName,
                                    "price": cartItemsList[i].price,
                                    "quantity": cartItemsList[i].quantity,
                                    "uid": cartItemsList[i].uid,
                                    "date": formattedDate.toString()
                                  });

                                  setState(() {
                                    cartController.deleteCartItem(
                                        docId:
                                            cartItemsList[i].docId.toString());
                                  });
                                }
                                await pushAndReplacement(
                                    context, MyOrderScreen());
                              },
                              buttonName: 'Order Now',
                              buttonHeight: 60,
                              buttonWidth:
                                  screenWidth(context, dividedBy: 1.14),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
