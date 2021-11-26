import 'package:flutter/material.dart';

class FoodDetails extends StatelessWidget {
  final data;
  final textBlod = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  FoodDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _addAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(height: 16.0),
          _titulo(),
          SizedBox(height: 16.0),
          _info(),
          SizedBox(height: 16.0),
          _descripcion(),
        ])),
      ],
    ));
  }

  Widget _addAppBar() {
    final String url = 'assets/img/' + data['image'];
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Color.fromRGBO(243, 116, 67, 1),
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          data['name'],
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: AssetImage(url),
          placeholder: AssetImage('assets/img/pizza.png'),
        ),
      ),
    );
  }

  Widget _titulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(data['name'], style: textBlod),
                  SizedBox(height: 7.0),
                  // Text(
                  //   'Salmon, cream cheese, avocado',
                  //   style: TextStyle(fontSize: 14, color: Colors.grey),
                  // )
                ],
              ),
            ),
            Icon(Icons.star_border, color: Colors.yellow, size: 25.0),
            SizedBox(
              width: 6.0,
            ),
            Text(data['value'], style: TextStyle(fontSize: 15))
          ],
        ),
      ),
    );
  }

  Widget _info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _infoData(data['kcal'], 'kcal'),
        _infoData(data['pro'], 'proteina'),
        _infoData(data['carb'], 'carb'),
      ],
    );
  }

  Widget _infoData(String number, String name) {
    return Column(
      children: <Widget>[
        Text(
          number,
          style: textBlod,
        ),
        SizedBox(height: 5.0),
        Text(name)
      ],
    );
  }

  Widget _descripcion() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Text(
          data['description'],
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
