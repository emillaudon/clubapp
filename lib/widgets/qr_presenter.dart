import 'package:flutter/material.dart';

class QrPresenter extends StatefulWidget {
  const QrPresenter({Key? key}) : super(key: key);



  @override
  State<QrPresenter> createState() => _QrPresenterState();
}

class _QrPresenterState extends State<QrPresenter> {
  //TODO: Create qr image from widget
  //TODO: Make widget hold qr model to be ablet to show contents
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //TODO: Show qr
    //TODO: Show contents of qr on touch
    return Container(
      height: height * 0.4,
    );
  }
}