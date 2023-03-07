// import 'package:flutter/material.dart';
// import 'package:nectar/data/data.dart';
// import 'package:nectar/home/detail_page.dart';
//
// class CardModal extends StatefulWidget {
//   final Map<dynamic,dynamic> item;
//   final String itemName;
//   const CardModal({Key? key,required this.item,required this.itemName}) : super(key: key);
//
//   @override
//   State<CardModal> createState() => _CardModalState();
// }
//
// class _CardModalState extends State<CardModal> {
//   late Map<dynamic,dynamic> _item;
//   late String itemName ;
//   bool isRefresh = false;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _item = widget.item;
//     itemName = widget.itemName;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         borderRadius: BorderRadius.circular(30),
//         onTap: () async {
//
//           isRefresh = await Navigator.of(context).push(
//               MaterialPageRoute(
//                   builder: (context) => DetailPage(item: _item[i])
//               )
//           )??false;
//           if (isRefresh) {
//             setState(() {
//               refreshData();
//             });
//           }
//         },
//         child: Card(
//             elevation: 0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//               side: BorderSide(color: Colors.black.withOpacity(0.05)),
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   AspectRatio(
//                     aspectRatio: 5 / 4,
//                     child: FittedBox(
//                       fit: BoxFit.contain,
//                       child: Image.asset(
//                           _item[i]["img"],
//                           height: 80,
//                           fit: BoxFit.fitHeight
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10,),
//                   Text(
//                     _item[i]["title"],
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 23,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                   ),
//                   Text(
//                     "${_item[i]["quantity"]}, Price",
//                     style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.grey),
//                     softWrap: true,
//                   ),
//                   const SizedBox(height: 20,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "\$${_item[i]["price"]}",
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 23,
//                           fontFamily: "Gilroy",
//                         ),
//                       ),
//                       SizedBox(
//                         width: 40,
//                         height: 40,
//                         child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               elevation: 0,
//                               padding: EdgeInsets.zero,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(500)),
//                             ),
//                             onPressed: () {
//                               _item = GetData().filterSearch(byItem: itemName,limit: 2);
//                               setState(() {
//                                 _item[i]['favorite'] = GetData().addRemoveFavroite(_item[i]);
//                               });
//                             },
//                             child: Icon(
//                               Icons.favorite,
//                               color: _item[i]['favorite'] ? Colors.red : Colors.grey,
//                               size: 30,
//                             )
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ))
//
//     );
//   }
// }
