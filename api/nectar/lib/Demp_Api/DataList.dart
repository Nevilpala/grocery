// import 'package:flutter/material.dart';
// import 'package:nectar/data/api.dart';
//
// class DataList extends StatelessWidget {
//   final List<Data> datas;
//   const DataList({Key? key , required this.datas}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       ListView.builder(
//           itemCount: datas == null ? 0 : datas.length,
//           itemBuilder: (BuildContext context, int index) {
//             return
//               Card(
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => DetailWidget(datas[index])),
//                       );
//                     },
//                     child: ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text(datas[index].name),
//                       subtitle: Text(datas[index].age.toString()),
//                     ),
//                   )
//               );
//           });
//   }
// }
//
// class DetailWidget {
// }
