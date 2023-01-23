import 'package:flutter/material.dart';
import '../models/qr_code.dart';
import '../services/qr_service.dart';

class QrPresenter extends StatefulWidget {
   const QrPresenter({Key? key, this.qrCode}) : super(key: key);
   final Qr? qrCode;

  @override
  State<QrPresenter> createState() => _QrPresenterState();
}

class _QrPresenterState extends State<QrPresenter> {
  //TODO: Create qr image from widget
  //TODO: Make widget hold qr model to be ablet to show contents

  final QrService _qrService = QrService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //TODO: Show contents of qr on touch
    return widget.qrCode != null ? Container(
          padding: const EdgeInsets.all(10.0),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: _qrService.createQrImage(qrCode: widget.qrCode!),
        ) :
        Container();
  }
}