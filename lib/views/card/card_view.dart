import 'package:favotiteproject/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardView extends StatefulWidget {
  const CardView({super.key});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: favoriteCards.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteCards[index]['name']),
            subtitle: Text("${favoriteCards[index]['price']}"),
          );
        },
      ),
    );
  }
}
