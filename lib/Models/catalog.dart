// ignore_for_file: empty_constructor_bodies

class Catalog {
  static List<Items> items = [];
}

class Items {
  String name;
  int id;
  String desc;
  int price;
  String color;
  String img;

  Items(
      {required this.name,
      required this.id,
      required this.desc,
      required this.price,
      required this.color,
      required this.img});
}
