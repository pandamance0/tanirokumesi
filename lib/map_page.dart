import 'package:flutter/material.dart';
import 'package:tanirokumesi_app/shop_page.dart';
void main() => runApp(MapPage());
class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('テスト遷移'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShopPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}