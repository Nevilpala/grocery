import 'package:mongo_dart/mongo_dart.dart';

class Data {
  String id;
  ObjectId mongoId;
  String img;
  String title;
  double price;
  String quantity;
  String item;
  bool favorite;
  List<dynamic> other;
  int cart;
  int single;

  Data({
    required this.mongoId,
    required this.id,
    required this.img,
    required this.title,
    required this.price,
    required this.quantity,
    required this.item,
    required this.favorite,
    required this.other,
    required this.cart,
    required this.single,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'] as String,
        mongoId: json['_id'] as ObjectId,
        img: json['img'] as String,
        title: json['title'] as String,
        price: double.parse(json['price'].toString()),
        quantity: json['quantity'] as String,
        item: json['item'] as String,
        favorite: json['favorite'] as bool,
        cart: int.parse(json['cart'].toString()),
        other: json['other'] as List<dynamic>,
        single: int.parse(json['single'].toString())
    );
  }

  static Map<String, dynamic> toJson(Data data) {
    final Map<String, dynamic> map = {};
    map['id'] = data.id;
    map['_id'] = data.mongoId;
    map['img'] = data.img;
    map['title'] = data.title;
    map['price'] = data.price.toString();
    map['quantity'] = data.quantity;
    map['item'] = data.item;
    map['favorite'] = data.favorite;
    map['other'] = data.other.map((v) => v.toJson()).toList();
    map['cart'] = data.cart.toString();
    map['single'] = data.single.toString();
    return map;
  }

// class Data {
//   final int id;
//   final String img;
//   final String title;
//   final String price;
//   final String quantity;
//   final String item;
//   bool favorite;
//   int cart;
//   int single;
//   List other;
//
//   Data({
//     required this.id,
//     required this.img,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.item,
//     required this.favorite,
//     required this.cart,
//     required this.single,
//     required this.other,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       id: int.parse(json['id']),
//       img: json['img'] as String,
//       title: json['title'] as String,
//       price: json['price'] as String,
//       quantity: json['quantity'] as String,
//       item: json['item'] as String,
//       favorite: json['favorite'] as bool,
//       cart: int.parse(json['cart']),
//       other: json['other'] as List,
//       single: int.parse(json['single']),
//   );
//   }
//
//   // @override
//   // String toString() {
//   //   // return 'Data{id: $id, title: $title, price: $price}';
//   // }
//
//   // factory Data.toMap(Data data) {
//   //   Map<String, dynamic> map = {};
//   //   map['id'] = data.id;
//   //   map['img'] = data.img;
//   //   map['title'] = data.title;
//   //   map['price'] = data.price;
//   //   map['item'] = data.item;
//   //   map['quantity'] = data.quantity;
//   //   map['favorite'] = data.favorite;
//   //   map['cart'] = data.cart;
//   //   map['single'] = data.single;
//   //   map['other'] = data.other;
//   //   return map;
//   // }
}
