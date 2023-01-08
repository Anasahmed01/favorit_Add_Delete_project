import 'package:favotiteproject/data/data.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: favoriteItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(favoriteItems[index]['name']),
            );
          }),
    );
  }
}
