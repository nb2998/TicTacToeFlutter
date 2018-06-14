import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final title;
  final message;
  final VoidCallback callback;
  final actionText;

  CustomDialog(this.title, this.message, this.callback,
      [this.actionText = "Reset"]);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new AlertDialog(
      title: new Text(title),
      content: new Text(message),
      actions: <Widget>[
        new FlatButton(
          onPressed: callback,
          child: new Text(actionText),
          color: Colors.white,
        )
      ],
    );
  }
}
