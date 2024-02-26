import 'package:flutter/material.dart';
import 'package:flutter_navigasi/models/item.dart';
import 'package:iconsax/iconsax.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item itemArgs = (ModalRoute.of(context)!.settings.arguments) as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Item"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Iconsax.home),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(itemArgs.image),
                  ),
                ),
              ),
            ),
            Text(itemArgs.name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 48),),
            //Text(itemArgs.toString()),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(itemArgs.description,),
            )

          ],
        ),
      ),
    );
  }
}
