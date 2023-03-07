
import 'package:mongo_dart/mongo_dart.dart';
import 'package:nectar/data/data.dart';

class DataBase {
  static var db, userCollection;
  static const MONGO_CONN_URL = 'mongodb+srv://nevilpala:nevilpala@nevil.wzohktp.mongodb.net/Nectar?retryWrites=true&w=majority';
  static const USER_COLLECTION = 'nectar';

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<List<Data>> getData() async {
    try {
      List<Map<String, dynamic>> users = await userCollection.find().toList();
      List<Data> userList = users.map((dynamic item) => Data.fromJson(item)).toList();
      return userList;
    } catch (e) {
      print("ERROR");
      print(e);
      return [];
    }
  }

  static Future<List<Data>> filterSearch({String? byItem,int? limit}) async {
    try {
      List<Map<String, dynamic>> users = await userCollection.find({"item": byItem}).toList();

      List<Data> data = users.map((dynamic item) => Data.fromJson(item)).toList();
        return data;
    } catch (e) {
      print("ERROR");
      return [];
    }
  }

  static Future<bool> addRemoveFavroite(data) async{
    bool flag = data.favorite;
    data.favorite = !flag;
    data = await DataBase.updateData(data.id,data);
    return !flag;
  }

  static Future<Data> addCart(data,count) async{
    data.cart = count;
    data = await updateData(data.id,data);
    return data;
  }

  static Future<List<Data>> favoriteItem() async{

      List<Map<String, dynamic>> users = await userCollection.find().toList();
      List<Data> data = users.map((dynamic item) => Data.fromJson(item)).toList();
      data = data.where((Data item) => item.favorite == true).toList();
      return data;
  }

  static Future<List<Data>> cartItem() async{
    List<Map<String, dynamic>> users = await userCollection.find({"cart" : {r"$gt" : 0 }}).toList();
    print(users);
    List<Data> data = users.map((dynamic item) => Data.fromJson(item)).toList();
    return data;
  }

  static Future<void> removeCartItem(id) async{
    var data = await getCaseById(id);
    print(data);
    data.cart = 0;
    data = await updateData(id,data);
  }

  static Future<Data> updateData(id, Data data) async {
    Map dataMap = Data.toJson(data);
    var u = await userCollection.findOne({"id": id});
    u = dataMap;
    await userCollection.save(u);
    print(dataMap);
    return data;
  }

  static Future<Data> getCaseById(id) async {
    var u = await userCollection.findOne({"id": id});
    return Data.fromJson(u);
  }

//
//   static insert(Data user) async {
//     await userCollection.insertAll([user]);
//   }
//
//   static update(Data user) async {
//     var u = await userCollection.findOne({"_id": user.id});
//     u.
//     u["name"] = user.name;
//     u["age"] = user.age;
//     u["phone"] = user.phone;
//     await userCollection.save(u);
//   }
//
//   static delete(Data user) async {
//     await userCollection.remove(where.id(user.id));
//   }
}
