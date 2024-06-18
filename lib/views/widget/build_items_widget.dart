import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'build_text_widget.dart';

class BuildItemsWidget extends StatefulWidget {
  final String? name;
  final String? price;

  final String networkImage;

  final Function onTap;
  const BuildItemsWidget(
      {super.key,
      this.name,
      this.price,
      required this.networkImage,
      required this.onTap});

  @override
  State<BuildItemsWidget> createState() => _BuildItemsWidgetState();
}

class _BuildItemsWidgetState extends State<BuildItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              widget.onTap();
              // print("ListImages");
              // print(widget.listImage);
            },
            child: Container(
              width: screenWidth(context, dividedBy: 2),
              height: screenHeight(context, dividedBy: 4.7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(widget.networkImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          BuildTextWidget(
              text: widget.name.toString(),
              size: 17,
              color: Constants.kitGradients[0],
              fontWeight: FontWeight.bold),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: BuildTextWidget(
              text: "₹ ${widget.price.toString()}",
              size: 15,
              color: Constants.kitGradients[5].withOpacity(0.6),
              fontFamily: "Helvetica.ttf",
            ),
          ),
        ],
      ),
    );
  }
}
