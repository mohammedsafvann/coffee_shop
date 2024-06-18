import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/widget/build_text_button_widget.dart';
import '../views/widget/build_text_widget.dart';
import 'constants.dart';

///it contain common functions
class Utils {}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).height / dividedBy;
}

double screenWidth(BuildContext context, {double dividedBy = 1}) {
  return screenSize(context).width / dividedBy;
}

Future<dynamic> push(BuildContext context, Widget route) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => route));
}

void pop(BuildContext context, String s) {
  return Navigator.pop(context);
}

Future<dynamic> pushAndRemoveUntil(
    BuildContext context, Widget route, bool goBack) {
  return Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => route), (route) => goBack);
}

Future<dynamic> pushAndReplacement(BuildContext context, Widget route) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => route));
}

void removeItemAlert(
  BuildContext context, {
  String? titleMsg,
  String? contentMsg,
  String? msgCancel,
  String? msgOk,
  Function? onPressedOK,
  Function? onPressedCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        shape: ShapeBorder.lerp(
            const RoundedRectangleBorder(), const RoundedRectangleBorder(), 1),
        backgroundColor: Constants.kitGradients[0],
        title: BuildTextWidget(text: titleMsg ?? " "),
//        content: new Text("Alert Dialog body"),
        content: BuildTextWidget(text: contentMsg ?? " "),
        actions: <Widget>[
          BuildTextButtonWidget(
              text: msgOk ?? " ",
              color: Constants.kitGradients[1],
              onPress: () {
                onPressedOK!();
              }),
          //usually buttons at the bottom of the dialog
          BuildTextButtonWidget(
              text: msgCancel ?? " ",
              color: Constants.kitGradients[1],
              onPress: () {
                onPressedCancel!();
              }),
        ],
      );
    },
  );
}
