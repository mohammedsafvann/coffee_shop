import 'package:coffee/bloc/order_bloc.dart';
import 'package:coffee/models/order_response_model.dart';
import 'package:coffee/views/widget/home_menu.dart';
import 'package:flutter/material.dart';
import '../../Utils/constants.dart';
import '../../Utils/utils.dart';
import '../widget/build_order_Item_widget.dart';
import '../widget/build_text_widget.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  bool isLoading = true;
  List<OrderResponseModel> orderItems = [];

  OrderBloc orderBloc = OrderBloc();

  getData() async {
    orderBloc.getMyOrderItems();

    // orderItems = (await firebaseServices.getOrderItems())!;
  }

  @override
  void initState() {
    getData();
    orderBloc.orderResponseModelStream.listen((event) {
      orderItems.addAll(event);

      setState(() {
        isLoading = false;
      });
    });
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
              pushAndReplacement(context, const HomeMenu());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Constants.kitGradients[0],
            ),
          ),
          title: BuildTextWidget(
            text: 'My Orders',
            color: Constants.kitGradients[0],
            fontWeight: FontWeight.w600,
            size: 22,
          ),
        ),
        backgroundColor: Constants.kitGradients[9],
        body: isLoading
            ? Container(
                height: screenHeight(
                  context,
                ),
                width: screenWidth(context),
                color: Colors.black,
                child: Center(
                  child: CircularProgressIndicator(
                      color: Constants.kitGradients[0]),
                ),
              )
            : orderItems.isEmpty
                ? Container(
                    height: screenHeight(
                      context,
                    ),
                    width: screenWidth(context),
                    color: Colors.black,
                    child: Center(
                      child: BuildTextWidget(
                          fontWeight: FontWeight.w500,
                          size: 18,
                          text: "You Have No Orders",
                          color: Constants.kitGradients[0]),
                    ),
                  )
                : SizedBox(
                    height: screenHeight(
                      context,
                    ),
                    child: ListView.builder(
                      itemCount: orderItems.length,
                      itemBuilder: (context, index) {
                        return BuildOrderItemWidget(
                          date: orderItems[index].date,
                          price: orderItems[index].price,
                          productId: orderItems[index].id,
                          onTap: () {},
                          productName: orderItems[index].itemName,
                          quantity: orderItems[index].quantity,
                          image: orderItems[index].image,
                        );
                      },
                    ),
                  ),
      ),
    );
  }
}
