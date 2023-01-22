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
        final qrCodeContainer = Container(
          padding: EdgeInsets.all(10.0),
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          child: _qrService.createQrImage(qr),
        );
        qrCode = qrCodeContainer;
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

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      newQrCode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
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
        onTap: _onItemTapped,
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
                  height: 250,
                  width: 250,
                  child: qrCode
                ),
              ],
          ),
        ),
          ],
      ),
    );
  }
}