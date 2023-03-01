import 'package:favotiteproject/data/data.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  num value = 0;

  increment() {
    setState(() {
      value++;
    });
  }

  decrement() {
    setState(() {
      value--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteCards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteCards[index]['name']),
            subtitle: Text("${favoriteCards[index]['price']}"),
            trailing: SizedBox(
              height: 30,
              width: 120,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (favoriteCards[index]['price']) {
                        favoriteCards[index]['price'] + decrement();
                      }
                    },
                    icon: const Icon(Icons.minimize),
                  ),
                  Text('${favoriteCards[index]['price'] + value}'),
                  IconButton(
                    onPressed: () {
                      favoriteCards[index]['price'] + increment();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
