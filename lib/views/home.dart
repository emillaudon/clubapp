import 'package:clubapp/views/qr_creation.dart';
import 'package:flutter/material.dart';
import '../services/qr_service.dart';
import '../models/qr_code.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        //TODO:Return qr presenter
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
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color(0xFFFFB6B6),
        selectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40.0,),
              label: 'Hem',
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add, size: 40.0,),
              label: 'Ny',
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.category, size: 40.0,),
              label: 'C',
              ),
        ],
      ),
      body: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/backgrounds/background_home.svg',
              ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //TODO: replace with qr presenter
                Container(
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
          ],
      ),
    );
  }
}