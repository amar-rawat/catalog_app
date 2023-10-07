import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/models/cart_model.dart';
import 'package:catalog_app/models/catalog_model.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/themes/mytheme.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            child: CatalogItem(catalog: catalog),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog,
                ),
              ),
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
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
            catalog.name.text.bold.lg.color(MyTheme.darkBluishColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                '\$${catalog.price}'.text.xl.bold.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).rounded.white.square(150).make().py8();
  }
}

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({super.key, required this.catalog});

  final CartModel _cart = (VxState.store as MyStore).cart;
  final CatalogModel _catalog = (VxState.store as MyStore).catalog;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(MyTheme.darkBluishColor),
            shape: const MaterialStatePropertyAll(StadiumBorder())),
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        child: isInCart
            ? const Icon(Icons.done)
            : const Icon(CupertinoIcons.cart_badge_plus));
  }
}
