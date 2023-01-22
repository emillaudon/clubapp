import 'package:flutter/material.dart';
import '../models/qr_code.dart';
import 'package:flutter_svg/svg.dart';

class QrCreation extends StatelessWidget {
  QrCreation({Key? key}) : super(key: key);
  TextEditingController receiverController = TextEditingController();
  TextEditingController secondReceiverController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void createQrAndGoBack(context) {
    final qr = createQr();
    Navigator.pop(context, qr);
  }

  Qr createQr() {
    final String firstReceiver = receiverController.text;
    final String secondReceiver = secondReceiverController.text;
    final String receiver = secondReceiver != "" ? '$firstReceiver,$secondReceiver' : firstReceiver;
    final String subject = subjectController.text;
    final String body = bodyController.text;

    final Qr qr = Qr(receiver: receiver, subject: subject, body: body);

    return qr;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    secondReceiverController.text = 'willyshandelsklubb@gmail.com';

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child:  Center(
          child:
          Stack(
            children: [
              SvgPicture.asset(
                'assets/images/backgrounds/background_home.svg',
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 50.0),
                  width: width * 0.9,
                  height: height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                        const Text('Ny Kod',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                              color: Colors.white
                          ),),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Mottagare',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.white
                            ),
                          ),
                        ),
                        TextField(
                          controller: receiverController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              hintText: ''
                          ),),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: secondReceiverController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              hintText: ''
                          ),),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Rubrik',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.white
                            ),
                          ),
                        ),
                        TextField(
                          controller: subjectController,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white70,
                              hintText: ''
                          ),),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Meddelande',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.white
                            ),
                          ),
                        ),
                        TextField(
                          controller: bodyController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              hintText: ''
                          ),),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 140.0, vertical: 15.0),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                              )
                          ),
                          child: const Text('FÄRDIG'),
                          onPressed: () => createQrAndGoBack(context),)
                      ]),
                ),
              )
            ],
          ),
            )
        ),
    );
  }
}