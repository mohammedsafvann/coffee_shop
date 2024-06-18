import 'package:coffee/controller/cart_controller.dart';
import 'package:coffee/views/screens/cart_screen.dart';
import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../../Utils/utils.dart';
import 'build_add_remove_qty_widget.dart';
import 'build_text_widget.dart';

class BuildCartItemsWidget extends StatefulWidget {
  final String productName;
  final String productId;
  final String? size;
  final String price;
  final String networkImage;
  final Function(int) add;
  final Function(int) sub;
  final Function onTap;
  final Function onTapBackToDetails;
  ValueChanged itemCount;
  int count;
  // Function onRemove;

  BuildCartItemsWidget({
    super.key,
    required this.productName,
    this.size,
    required this.price,
    required this.networkImage,
    // required this.onRemove,
    required this.count,
    required this.add,
    required this.sub,
    required this.itemCount,
    required this.productId,
    required this.onTapBackToDetails,
    required this.onTap,
  });

  @override
  State<BuildCartItemsWidget> createState() => _BuildCartItemsWidgetState();
}

class _BuildCartItemsWidgetState extends State<BuildCartItemsWidget> {
  CartController cartController = CartController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 25),
      height: screenHeight(context, dividedBy: 4.80),
      // height: screenHeight(context, dividedBy: 3.5),
      // width: screenWidth(context, dividedBy: 2),
      color: Constants.kitGradients[8],

      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            widget.onTapBackToDetails();
          },
          child: Image(
            image: NetworkImage(widget.networkImage),
            height: screenHeight(context, dividedBy: 6),
            width: screenWidth(context, dividedBy: 4),
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: screenWidth(context, dividedBy: 1.7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: BuildTextWidget(
                        text: widget.productName.toString(),
                        color: Constants.kitGradients[0],
                        fontFamily: "Helvetica.ttf",
                        size: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: InkWell(
                        onTap: () {
                          widget.onTap();
                        },
                        child: Icon(Icons.delete,
                            color: Constants.kitGradients[0]),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  BuildTextWidget(
                    text: "INR ₹ ${widget.price}",
                    size: 14,
                    color: Constants.kitGradients[0],
                    fontFamily: "Helvetica.ttf",
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: screenWidth(context, dividedBy: 7.2),
                  ),
                  BuildAddRemoveQtyWidget(
                    key: UniqueKey(),
                    count: widget.count, add: widget.add, sub: widget.sub,
                    quantity: (value) {
                      print("!!!!!!");
                      widget.itemCount(value);
                    },
                    // onAdd: widget.onAdd,
                    // onSub: widget.onSub,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ]),
    );
  }

  showAlertDialog(BuildContext context, {required String id}) {}
}
