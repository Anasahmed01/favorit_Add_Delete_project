import 'package:favotiteproject/views/card/card_view.dart';
import 'package:favotiteproject/views/favorite/favorite_view.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteView(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardView(),
                  ),
                );
              },
              icon: const Icon(Icons.add_card_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]['name']),
            subtitle: Text("${products[index]['price']}"),
            trailing: SizedBox(
              height: 30,
              width: 100,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (products[index]['isFavorite'] == true) {
                        setState(() {
                          products[index]['isFavorite'] = false;
                          favoriteItems.removeWhere(
                              (element) => element == products[index]);
                        });
                      } else {
                        setState(() {
                          products[index]['isFavorite'] = true;
                          favoriteItems.add(products[index]);
                        });
                      }
                      print(favoriteItems);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: products[index]['isFavorite']
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (products[index]['isFavorite'] == true) {
                        setState(() {
                          products[index]['isFavorite'] = false;
                          favoriteCards.removeWhere(
                              (element) => element == products[index]);
                        });
                      } else {
                        setState(() {
                          products[index]['isFavorite'] = true;
                          favoriteCards.add(products[index]);
                        });
                      }
                      print(favoriteCards);
                    },
                    icon: Icon(
                      Icons.add_card_outlined,
                      color: products[index]['isFavorite']
                          ? Colors.blue
                          : Colors.grey,
                    ),
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
