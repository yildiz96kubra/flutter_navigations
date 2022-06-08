import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/green_page.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: Anasayfa(),
      routes: {
        '/redPage': (context) => RedPage(),
        '/': (context) => Anasayfa(),
        '/orangePage': (context) => OrangePage(),
      },
    );
  }
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation İşlemleri'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? _gelensayi = await Navigator.push<int>(context,
                    CupertinoPageRoute(builder: (redContext) => RedPage()));
                print('Ana sayfadaki sayı $_gelensayi');
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: Text(
                'Kırmızı Sayfaya Gir IOS',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.push(context, route);
                Navigator.of(context)
                    .push<int>(
                        MaterialPageRoute(builder: (redContext) => RedPage()))
                    .then((int? value) {
                  debugPrint('Gelen sayı $value');
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: Text(
                'Kırmızı Sayfaya Gir Android',
              ),
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrangePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
              child: Text(
                'Push Replacament Kullanımı',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/redPage');
              },
              style: ElevatedButton.styleFrom(primary: Colors.blue.shade600),
              child: Text(
                'PushNamed Kullanımı',
              ),
            )
          ],
        ),
      ),
    );
  }
}
