import 'package:flutter/material.dart';
import 'package:tanirokumesi_app/map_page.dart';
import 'package:tanirokumesi_app/event_page.dart';

import 'package:dots_indicator/dots_indicator.dart';

void main() {
  runApp(ShopPage());
}

class ShopPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;

  final pageLength = 3;
  double currentIndexPage = 1;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ヘッダー
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlineButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapPage(),
                          ),
                        );
                      },
                      borderSide: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('back'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text('ピッツェリアリッセ'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 画像
            Column(
              children: <Widget>[
                Container(
                  height: 320,
                  child: PageView(
                    children: <Widget>[
                      Image.network(
                        'https://i.gyazo.com/a56de364eb8aaefc73891dc382674228.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://i.gyazo.com/b60589fe5d9273dfd38cc713ffeb8dcd.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://i.gyazo.com/750daea40962abdcd5a73db4d630dfdc.jpg',
                        fit: BoxFit.cover,
                      ),
                      DotsIndicator(
                          dotsCount: pageLength,
                          position: currentIndexPage
                      )
                    ],
                  ),
                ),
              ],
            ),
            // メニュー
            Container(
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              child: OutlineButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventPage(),
                    ),
                  );
                },
                borderSide: const BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text('メニュー/写真'),
              ),
            ),
            // フッター
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.only(
                  top:10,
                  bottom: 200,
                  right: 10,
                  left: 10,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Row(children: <Widget>[
                        Container(
                          child: Column(
                            children: const <Widget>[
                              Text('定休日', style: TextStyle(fontSize: 20,
                                  color: Colors.orange),),
                              Text('月曜日・火曜日',),
                              Text('営業時間', style: TextStyle(fontSize: 20,
                                  color: Colors.orange),),
                              Text('10時〜20時',),
                              Text('電話番号', style: TextStyle(fontSize: 20,
                                  color: Colors.orange),),
                              Text('080-0000-0000'),
                            ],
                          ),
                        ),
                      ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('座席数', style: TextStyle(fontSize: 20,
                              color: Colors.orange),),
                          Text('テーブル10'),
                          Text('カウンター8'),
                          Text('決済手段', style: TextStyle(fontSize: 20,
                              color: Colors.orange),),
                          Text('現金'),
                          Text('クレジットカード'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text('営業時間', style: TextStyle(fontSize: 20,
                              color: Colors.orange),),
                          Text('10時〜20時'),
                          Text('住所', style: TextStyle(fontSize: 20,
                              color: Colors.orange),),
                          Text('〒540-0012'),
                          Text('大阪市中央区瓦屋町'),
                          Text('6丁目2-21'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}