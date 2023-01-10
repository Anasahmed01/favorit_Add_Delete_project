import 'package:favotiteproject/views/favorite/favorite_view.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map> products = [
    {
      'name': "Biryrani",
      'price': 2000,
      'isFavorite': false,
    },
    {
      'name': "Burger",
      'price': 50,
      'isFavorite': false,
    },
    {
      'name': "Nihari",
      'price': 20,
      'isFavorite': false,
    },
    {
      'name': "Qorma",
      'price': 200,
      'isFavorite': false,
    },
    {
      'name': "Mandi",
      'price': 150,
      'isFavorite': false,
    },
  ];

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
              onPressed: () {}, icon: const Icon(Icons.add_card_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(products[index]['name']),
              subtitle: Text("${products[index]['price']}"),
              trailing: Row(
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
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: products[index]['isFavorite']
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_card_outlined,
                      color: products[index]['isFavorite']
                          ? Colors.red
                          : Colors.grey,
                    ),
                  )
                ],
              ));
        },
      ),
    );
  }
}
