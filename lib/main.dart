import 'package:flutter/material.dart';

import 'String.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  Strings.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                Strings.name_one,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          FavWidget()
        ],
      ),
    );

    Widget buttonSection = SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32),
      child:  Text(
        Strings.name_two),

    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lake View App'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 250,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

class FavWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {
  // Step 1 - Created Default variables
  bool _isFav = true; // Selected = True , UnSelected = False
  int _favCount = 41; // value = 41

  void _toggleFav() {
    setState(() {
      if (_isFav) {
        // Selected = True
        _favCount -= 1; // 40 = value
        _isFav = false; // Icon as unSelected = false
      } else {
        _favCount += 1;
        _isFav = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: IconButton(
            alignment: Alignment.centerRight,
            onPressed: _toggleFav,
            icon: (_isFav // false
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)), // condition ? true : false
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favCount'), // value = 40
          ),
        )
      ],
    );
  }
}