import 'package:catalog_app/themes/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      'Catalog App'.text.xl5.bold.color(MyTheme.darkBluishColor).make(),
      'Treading products'.text.xl2.make()
    ]);
  }
}
