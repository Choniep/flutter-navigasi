import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '';

import '../models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Corolla',
        prices: 43000,
        description:
            'Sedan kekeluargaan, tetap stylish designnya',
        image: 'assets/images/corolla_toyota.png'),
    Item(
        name: 'Prius',
        prices: 40000,
        description: 'dulunya jadi mobil hybrid pertama di dunia',
        image: 'assets/images/prius_toyota.png'),
    Item(
        name: 'Supra',
        prices: 97000,
        description: 'Mobil kenceng-kencengan anak skena',
        image: 'assets/images/supra_toyota.png'),
    Item(
        name: 'Taycan',
        prices: 97000,
        description: 'Mobil kenceng-kencengan anak starboy',
        image: 'assets/images/taycan_porsche.png'),

  ];

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)!.settings.arguments) as Map;


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
      body: Column(
        children: [
          Container(
            height: 50,
            child: Text("Halo" + arguments['nama']),
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
