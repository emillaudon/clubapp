import 'package:clubapp/views/qr_creation.dart';
import 'package:flutter/material.dart';
import '../services/qr_service.dart';
import '../models/qr_code.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final QrService _qrService = QrService();
  Widget qrCode = Container();

  void newQrCode() async {
    final qr = await goToQrCreation();
    if (qr != null) {
      setState(() {
        qrCode = _qrService.createQrImage(qr);
      });
    }
  }

  Future<Qr> goToQrCreation() async {
    final qrCode = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QrCreation())
    );

    return qrCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 200,
              width: 200,
              child: qrCode
            ),
            ElevatedButton(
              child: const Text('Skapa Qr'), 
              onPressed: () => newQrCode(),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newQrCode,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}