// class Data {
//   Data({
//       required this.id,
//       required this.img,
//       required this.title,
//       required this.price,
//       required this.quantity,
//       required this.item,
//       required this.favorite,
//       required this.other,
//       required this.cart,
//       required this.single,});
//
//   Data.fromJson(dynamic json) {
//     id = json['id'];
//     img = json['img'];
//     title = json['title'];
//     price = json['price'];
//     quantity = json['quantity'];
//     item = json['item'];
//     favorite = json['favorite'];
//     if (json['other'] != null) {
//       other = [];
//       json['other'].forEach((v) {
//         other.add(Dynamic.fromJson(v));
//       });
//     }
//     cart = json['cart'];
//     single = json['single'];
//   }
//   String id;
//   String img;
//   String title;
//   String price;
//   String quantity;
//   String item;
//   bool favorite;
//   List<dynamic> other;
//   String cart;
//   String single;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['img'] = img;
//     map['title'] = title;
//     map['price'] = price;
//     map['quantity'] = quantity;
//     map['item'] = item;
//     map['favorite'] = favorite;
//     if (other != null) {
//       map['other'] = other.map((v) => v.toJson()).toList();
//     }
//     map['cart'] = cart;
//     map['single'] = single;
//     return map;
//   }
//
// }