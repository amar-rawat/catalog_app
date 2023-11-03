class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "Amar",
        desc: "none",
        price: 999,
        color: 'blue',
        image:
            'https://rukminim1.flixcart.com/image/850/1000/km2clu80/mobile/r/g/e/rog-phone-5-zs673ks-1a053in-asus-original-imagff5hp2scqwyn.jpeg?q=90')
  ];

  // get item by id
  Item getById(int id) {
    return items.firstWhere((element) => element.id == id);
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  fromMap() {}
}
