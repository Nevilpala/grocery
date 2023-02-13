// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
//
// Future<Data> fetchAlbum() async {
//   final response = await http
//       .get(Uri.parse('https://6311876619eb631f9d73fd4a.mockapi.io/temp'));
//
//   if (response.statusCode == 200) {
//     return Data.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
//
//
// }
//
//
//
//
//
// class Data {
//   Data({
//     required this.img,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.item,
//     required this.favorite,
//     required this.cart,
//   });
//   String img;
//   String title;
//   double price;
//   String quantity;
//   String item;
//   bool favorite;
//   int cart;
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       img : json['img'],
//       title : json['title'],
//       price : json['price'],
//       quantity : json['quantity'],
//       item : json['item'],
//       favorite : json['favorite'],
//       cart : json['cart']
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// // import 'dart:async';
// //
// // // Make a POST request to the API to create a resource
// // final response = await http.post('https://6311876619eb631f9d73fd4a.mockapi.io/employees',
// // headers: {'Content-Type': 'application/json'},
// // body: json.encode({'field1': 'value1', 'field2': 'value2'}));
// //
// // // Check the status code of the response
// // if (response.statusCode == 201) {
// // print('Resource created successfully.');
// // } else {
// // print('Failed to create resource.');
// // }
// //
// //
// //
// //
// //
// //
// //
// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // //
// // // class API {
// // //   static Future getData() async {
// // //     http.Response response = await http.get('https://6311876619eb631f9d73fd4a.mockapi.io/employees');
// // //     if (response.statusCode == 200) {
// // //       return json.decode(response.body);
// // //     } else {
// // //       return null;
// // //     }
// // //   }
// // // }