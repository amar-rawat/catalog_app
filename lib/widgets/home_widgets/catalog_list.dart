import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog_model.dart';
import 'package:catalog_app/themes/mytheme.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';

import 'package:flutter/material.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.2,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8),
        // padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // catalog.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
                Text(
                  catalog.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: MyTheme.darkBluishColor),
                ),
                Text(
                  catalog.desc,
                  style: const TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                ),
                // catalog.desc.text.textStyle(context.captionStyle).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text('\$${catalog.price}'),
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
