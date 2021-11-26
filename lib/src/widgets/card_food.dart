import 'package:flutter/material.dart';
import 'package:eatme/src/pages/food_details.dart';

class CardFood extends StatelessWidget {
  final data;

  CardFood({required this.data});
  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 26.0),
        child: Row(
          children: [
            _contentText(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                child: Column(children: <Widget>[
                  Image.asset(
                    'assets/img/' + data['image'],
                    width: 120,
                    height: 70,
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );

    return GestureDetector(
      child: card,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FoodDetails(data: data)));
      },
    );
  }

  Widget _contentText() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              data['name'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              data['description'],
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            Text(
              'kcal: ' + data['kcal'],
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
