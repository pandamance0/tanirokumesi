import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tanirokumesi_app/shop_page.dart';

const kColorPrimary = Color(0xFF2E8376);
const kColorText = Color(0xFF9E9E9E);
const kColorTextDark = Color(0xFF212121);
const kColorFlightText = Color(0xFFE0E0E0);
const kColorFlightIcon = Color(0xFFC1B695);
const kColorTicketBorder = Color(0xFFE0E0E0);

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;

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
            Row(
              children: <Widget>[
                Container(
                  width: 120,
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      OutlineButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShopPage(),
                            ),
                          );
                        },
                        borderSide: const BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text('back'),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ],
            ),
            // 画像
            Container(
              height: 320,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                    'https://i.gyazo.com/bf199f85e0e43aad8c3565cfdaacfaf3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.gyazo.com/42038a7c00dd5b49a8ba317f72265064.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.gyazo.com/296c692a8f19ed6f082047448490410c.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://i.gyazo.com/d35d8625bfded9e4fb012fed5c9acd79.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 5,
                  right: 5,
                  bottom: 5,

                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          _Ticket(
                            image: Image.network('https://i.gyazo.com/b04b0cc9656e5b06a40057bdb09f5a09.jpg'),
                            title: 'AAA',
                            subtitle: 'aaa',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: <Widget>[
                          _Ticket(
                            image: Image.network('https://i.gyazo.com/b04b0cc9656e5b06a40057bdb09f5a09.jpg'),
                            title: 'BBB',
                            subtitle: 'bbb',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          _Ticket(
                            image: Image.network('https://i.gyazo.com/b04b0cc9656e5b06a40057bdb09f5a09.jpg'),
                            title: 'CCC',
                            subtitle: 'ccc',
                          ),
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

class _TicketShapeBorder extends ShapeBorder {
  final double width;
  final double radius;

  _TicketShapeBorder({
    @required this.width,
    @required this.radius,
  });

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsets.all(width);
  }

  @override
  ShapeBorder scale(double t) {
    return _TicketShapeBorder(
      width: width * t,
      radius: radius * t,
    );
  }

  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {
    if (a is _TicketShapeBorder)
      return _TicketShapeBorder(
        width: lerpDouble(a.width, width, t),
        radius: lerpDouble(a.radius, radius, t),
      );
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {
    if (b is _TicketShapeBorder)
      return _TicketShapeBorder(
        width: lerpDouble(width, b.width, t),
        radius: lerpDouble(radius, b.radius, t),
      );
    return super.lerpTo(b, t);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    return getOuterPath(
      rect.deflate(width),
      textDirection: textDirection,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final r = radius;
    final rs = radius / 3; // 区切り部分の半径
    final w = rect.size.width; // 全体の横幅
    final h = rect.size.height; // 全体の縦幅
    final wl = w / 3; // ロゴ部分の横幅
    return Path()
      ..addPath(
        Path()
          ..moveTo(r, 0)
          ..lineTo(wl - rs, 0) // →
          ..arcToPoint(
            Offset(wl + rs, 0),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(w - r, 0) // →
          ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
          ..lineTo(w, h - rs) // ↓
          ..arcToPoint(Offset(w - r, h), radius: Radius.circular(r))
          ..lineTo(wl + rs, h) // ←
          ..arcToPoint(
            Offset(wl - rs, h),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(r, h) // ←
          ..arcToPoint(Offset(0, h - r), radius: Radius.circular(r))
          ..lineTo(0, r) // ↑
          ..arcToPoint(Offset(r, 0), radius: Radius.circular(r)),
        Offset(rect.left, rect.top),
      );
  }
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = kColorTicketBorder;
    canvas.drawPath(
      getOuterPath(
        rect.deflate(width / 2.0),
        textDirection: textDirection,
      ),
      paint,
    );
  }
}

class _Ticket extends StatelessWidget {
  const _Ticket({
    //下記名前付き引数
    Key key,
    @required this.image, // 引数からWidget別に変わるものを渡す
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final Widget image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 120,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: _TicketShapeBorder(width: 1, radius: 20.0),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(20),
              child: image,
            ),
          ),
          Container(
            width: 1,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            color: kColorTicketBorder,
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Text(title), // テキストも引数から渡された値を使う
                                Text(subtitle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}