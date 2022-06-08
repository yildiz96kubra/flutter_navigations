import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('On will pop çalıştı');
        _rastgeleSayi = Random().nextInt(100);
        Navigator.pop(context, _rastgeleSayi);

        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Red Page'),
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Red Page',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                _rastgeleSayi = Random().nextInt(100);
                print('Üretilen Sayı $_rastgeleSayi');
                Navigator.of(context).pop(_rastgeleSayi);
              },
              child: Text('Geri Dön'),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print('evet pop olabilir');
                } else {
                  print('hayır olamaz');
                }
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: Text(
                'Can Pop Kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/orangePage');
                
                },
              
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: Text(
                'Go to Orange',
              ),
            ),
          ],
        )),
      ),
    );
  }
}
