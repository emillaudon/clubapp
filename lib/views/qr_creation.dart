import 'package:flutter/material.dart';
import '../models/qr_code.dart';

class QrCreation extends StatelessWidget {
  QrCreation({Key? key}) : super(key: key);
  TextEditingController receiverController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void createQrAndGoBack(context) {
    final qr = createQr();
    Navigator.pop(context, qr);
  }

  Qr createQr() {
    final String receiver = receiverController.text;
    final String subject = subjectController.text;
    final String body = bodyController.text;

    final Qr qr = Qr(receiver: receiver, subject: subject, body: body);

    return qr;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child:  Center(
          child: Container(
          width: width * 0.9,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
                TextField(
                controller: receiverController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Mottagare'
                ),),
                TextField(
                  controller: subjectController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Rubrik'
                ),),
                TextField(
                  controller: bodyController,
                maxLines: 5,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Meddelande'
                ),),
                ElevatedButton(
              child: const Text('FÄRDIG'), 
              onPressed: () => createQrAndGoBack(context),)
            ]),
          ),)
        ),
    );
  }
}