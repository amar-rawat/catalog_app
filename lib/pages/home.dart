import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/provider/all_providers.dart';
import 'package:catalog_app/themes/mytheme.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/catalog_model.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString('assets/file/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Catalog App'),
            ]),
            if (CatalogModel.items.isNotEmpty)
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    final catalog = CatalogModel.items[0];
                    return InkWell(
                      child: CatalogItem(catalog: catalog),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeDetailPage(),
                        ),
                      ),
                    );
                  })
            else
              const Center(
                child: CircularProgressIndicator(),
              ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cart");
        },
        backgroundColor: MyTheme.darkBluishColor,
        child: const Icon(CupertinoIcons.cart),
      ),
    );
  }
}
