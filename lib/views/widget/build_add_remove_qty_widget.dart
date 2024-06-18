import 'package:flutter/material.dart';

import '../../Utils/constants.dart';
import '../../Utils/utils.dart';
import 'build_icon_button_widget.dart';
import 'build_text_widget.dart';

class BuildAddRemoveQtyWidget extends StatefulWidget {
  // Function onAdd;
  // Function onSub;
  final Function(int) sub;
  final Function(int) add;
  int count;
  ValueChanged quantity;
  BuildAddRemoveQtyWidget({
    super.key,
    required this.count,
    required this.add,
    required this.sub,
    required this.quantity,
  });

  @override
  State<BuildAddRemoveQtyWidget> createState() =>
      _BuildAddRemoveQtyWidgetState();
}

class _BuildAddRemoveQtyWidgetState extends State<BuildAddRemoveQtyWidget> {
  int? itemCount;

  @override
  void initState() {
    itemCount = widget.count;
    print("itemCount");
    print(itemCount);
    super.initState();
  }

  // CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.kitGradients[8],
      width: screenWidth(context, dividedBy: 4.7),
      height: 26,
      child: Row(children: [
        Container(
          height: 26,
          width: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Constants.kitGradients[9]),
          child: BuildIconButtonWidget(
            icon: Icons.remove,
            iconSize: 9,
            iconColor: Constants.kitGradients[0],
            onPressed: () {
              setState(() {
                if (itemCount! > 1) {
                  itemCount = itemCount! - 1;
                  widget.sub(itemCount!);
                }
              });
              widget.quantity(itemCount);
            },
          ),
        ),
        Container(
          width: 24,
          height: 24,
          color: Constants.kitGradients[8],
          alignment: Alignment.center,
          child: BuildTextWidget(
              // text: "${widget.count}",
              text: itemCount.toString(),
              color: Constants.kitGradients[0],
              size: 10,
              fontFamily: "Helvetica.ttf"),
        ),
        Container(
          height: 26,
          width: 26,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Constants.kitGradients[1]),
          child: BuildIconButtonWidget(
              icon: Icons.add,
              iconSize: 10,
              iconColor: Constants.kitGradients[0],
              onPressed: () {
                print("sssssssssssssssssssssssssssssssssss");
                setState(() {
                  itemCount = itemCount! + 1;
                  widget.add(itemCount!);
                });
                widget.quantity(itemCount);

                // print("$widget.count");
              }),
        ),
      ]),
    );
  }
}
