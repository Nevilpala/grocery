// import 'package:grocery/data/constant.dart';
// import 'package:mongo_dart/mongo_dart.dart';
//
//
// class MongoDatabase{
//   static connect() async {
//     db = await Db.create(CONNECT_URL);
//     await db.open();
//     userCollection = db.collection(USER_COLLECTION);
//   }
//
//
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
//
// // void main() async{
// //   var db = Db('mongodb+srv://nevilpala:nevilpala@nevil.wzohktp.mongodb.net/Employee?retryWrites=true&w=majority');
// //   await db.open();
// //
// // }
// //
// //
//
//
//
//
//
//
// // import 'package:mongodb_driver/mongodb_driver.dart';
// //
// // // Connect to MongoDB Atlas
// // final uri = Uri.parse("mongodb+srv://<username>:<password>@cluster0.mongodb.net/test?retryWrites=true&w=majority");
// // final client = MongoClient(uri);
// // final db = client.database("test");
// // final coll = db.collection("mycollection");
// //
// // // Insert a document
// // final doc = {"name": "John Doe", "age": 30};
// // await coll.insertOne(doc);
// //
// //
// //
// //
//
//
//
//
//
//
//
// // import 'dart:developer';
// //
// // import 'package:mongo_dart/mongo_dart.dart';
// // import 'constant.dart';
// //
// // class MongoDBConnection{
// //   static var  db,userCollection ;
// //
// //   static connect() async {
// //     db = await Db.create(CONNECT_URL);
// //     await db.open();
// //     inspect(db);
// //     userCollection = db.collection(COLLECTION);
// //   }
// // }