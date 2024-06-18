import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'build_text_widget.dart';

class BuildOrderItemWidget extends StatefulWidget {
  final String? productName;
  final String? quantity;

  final String? image;
  final String? productId;
  final String? price;
  final String? date;

  final Function onTap;

  const BuildOrderItemWidget({
    super.key,
    this.productName,
    this.quantity,
    this.image,
    required this.onTap,
    this.productId,
    this.price,
    this.date,
  });

  @override
  State<BuildOrderItemWidget> createState() => _BuildOrderItemWidgetState();
}

class _BuildOrderItemWidgetState extends State<BuildOrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            width: screenWidth(context),
            height: screenHeight(context, dividedBy: 5),
            color: Constants.kitGradients[16],
            // color: Constants.kitGradients[12],
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: screenWidth(context, dividedBy: 4),
                      height: screenHeight(context, dividedBy: 7),
                      child: Image.network(
                        widget.image.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // height: 15,
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    BuildTextWidget(
                      fontFamily: "Helvetica.ttf",
                      text: widget.productName.toString(),
                      fontWeight: FontWeight.w400,
                      size: 14,
                      color: Constants.kitGradients[0],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    BuildTextWidget(
                      text: " Quantity ${widget.quantity}",
                      fontWeight: FontWeight.w200,
                      size: 12,
                      color: Constants.kitGradients[5],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          // width: 140,
                          width: screenWidth(context, dividedBy: 2.9),
                        ),
                        InkWell(
                          onTap: () {
                            widget.onTap();
                          },
                          child: BuildTextWidget(
                            text: widget.date.toString(),
                            color: Constants.kitGradients[5],
                            fontWeight: FontWeight.w200,
                            size: 10,
                            fontFamily:
                                "assets/fontfamily/GeneralSans-Regular.ttf",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildTextWidget(
                      text: "₹ ${widget.price.toString()}",
                      size: 10.5,
                      color: Constants.kitGradients[5],
                      fontFamily: "assets/fontfamily/GeneralSans-Regular.ttf",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
