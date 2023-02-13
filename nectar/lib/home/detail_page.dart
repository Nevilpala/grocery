// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:nectar/data/data.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Map<dynamic, dynamic> item;
  int? index;
  DetailPage({Key? key, required this.item , this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Map<dynamic, dynamic> item;
  int countCart = 0;
  var data = GetData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(item);
    item=widget.item;
    countCart = item['cart'];
    print("Detail PAGE REFRESH : $item");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.00,
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.black,
        toolbarHeight: 65,
        leading: InkWell(child: const Icon(Icons.chevron_left,size: 35,),onTap: (){
          Navigator.of(context).pop(true);
        },),

      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
            child: Image.asset(
              item['img'],
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item["title"] ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(500)),
                          ),
                          onPressed: () {
                            setState(() {
                              item['favorite'] = data.addRemoveFavroite(item);
                            });
                          },
                          child: Icon(
                            Icons.favorite,
                            color: item['favorite']==true ? Colors.red : Colors.grey,
                            size: 30,
                          )
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${item["quantity"]}, Price",
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.grey),
                    softWrap: true,
                  ),
                  SafeArea(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        countCart != 0
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (countCart > 0) countCart -= 1;
                                        setState(() {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        side: BorderSide(
                                            color: countCart >= 1
                                                ? Colors.green
                                                : Colors.grey),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15)), // <-- Radius
                                      ),
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: (countCart >= 1
                                              ? Colors.green
                                              : Colors.grey),
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Center(
                                      child: Text(
                                        "$countCart",
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (countCart > 0) countCart += 1;
                                        setState(() {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        side:
                                            const BorderSide(color: Colors.green),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15)), // <-- Radius
                                      ),
                                      child: const Text(
                                        "+",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                width: 135,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    countCart = 1;
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white24,
                                    elevation: 0,
                                    side: const BorderSide(color: Colors.green),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)), // <-- Radius
                                  ),
                                  child: const Text(
                                    "+ Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                        Text(
                          "\$${item["price"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              fontFamily: "Gilroy"),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(child: Container()),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                            "Product Details",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                        ),
                        Icon(Icons.chevron_right,color: Colors.black,)


                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Nutrition",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.chevron_right,color: Colors.black,)
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 1)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Review",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Icon(Icons.chevron_right,color: Colors.black,)
                      ],
                    ),
                  ),
                  SafeArea(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ],),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.only(right: 20,left: 20,bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            if(countCart==0){
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildPopupDialog(context),
              );
            }else{
              item = data.addCart(item,countCart);
              // FilterPage().refreshData();
              Navigator.pop(context,true);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green.shade400,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ), // <-- Radius
          ),
          child: const Text(
            "Add To Basket",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      )
      ,
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(''),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("Please Add Item",
          style: TextStyle(
            fontSize:25,
            fontWeight: FontWeight.bold
          ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
