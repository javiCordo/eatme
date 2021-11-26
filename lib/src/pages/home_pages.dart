import 'package:eatme/src/providers/menu_provider.dart';
import 'package:eatme/src/widgets/card_food.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Eatme'),
          backgroundColor: Color.fromRGBO(243, 116, 67, 1),
        ),
        body: _list());
  }

  Widget _list() {
    return FutureBuilder(
        future: menuProvider.dataLoad(),
        initialData: [],
        builder:
            (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) =>
                ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  children: _listItems(snapshot.data, context),
                ));
  }

  List<Widget> _listItems(data, context) {
    final List<Widget> options = [];

    data.forEach((opt) {
      final widgetTemp = CardFood(data: opt);
      options.add(widgetTemp);
    });

    return options;
  }
}
