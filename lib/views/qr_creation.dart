import 'package:flutter/material.dart';

class QrCreation extends StatelessWidget {
  const QrCreation({Key? key}) : super(key: key);

  void goBack(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child:  Container(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  [
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Mottagare'
                ),),
                const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Rubrik'
                ),),
                const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Meddelande'
                ),),
                ElevatedButton(
              child: const Text('f'), 
              onPressed: () => goBack(context),)
            ]),
          )
        ),
    );
  }
}