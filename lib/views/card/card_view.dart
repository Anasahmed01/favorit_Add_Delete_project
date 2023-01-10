import 'package:favotiteproject/data/data.dart';
import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  int value = 0;

  increment() {
    setState(() {
      value++;
    });
    print(value);
  }

  decrement() {
    setState(() {
      value--;
    });
    print(value);
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
                      decrement();
                    },
                    icon: const Icon(Icons.minimize),
                  ),
                  Text('${value}'),
                  IconButton(
                    onPressed: () {
                      increment();
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
