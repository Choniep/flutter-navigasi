import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Sugar',
        prices: 5000,
        description:
            'gula ini yang fungsinya bikin manis, tapi sayangnya ga bisa bikin manis masa lalu',
        image: 'assets/images/sugar_images.jpg'),
    Item(
        name: 'Salt',
        prices: 2000,
        description: 'garam merupakan salah satu bumbu dapur yang menimbulkan rasa asin',
        image: 'assets/images/salt_images.jpg'),
    Item(
        name: 'Terasi',
        prices: 10000,
        description: 'buat nyambel, monggo bisa dipilih',
        image: 'assets/images/terasi_images.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Iconsax.home),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(item.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)),
                            Expanded(
                              child: Text(
                                item.prices.toString(),
                                textAlign: TextAlign.end,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(item.image))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Container(
                                    height: 50,
                                    width: 150,
                                    child: Text(
                                      item.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
