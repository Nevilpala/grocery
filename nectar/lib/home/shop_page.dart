import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/data/data.dart';
import 'package:nectar/filter_page.dart';
import 'package:nectar/home/detail_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late List<Map<dynamic, dynamic>> _item;
  var size,height,width;
  bool isRefresh = false;
  // int =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshData();
  }
  void refreshData() {
    // _item = GetData().filterSearch();
  }

  Widget getCard(int i,itemName) {
    _item = GetData().filterSearch(byItem: itemName,limit: 2);
    return InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () async {
          _item = GetData().filterSearch(byItem: itemName,limit: 2);

          isRefresh = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => DetailPage(item: _item[i])
              )
          )??false;
          if (isRefresh) {
            setState(() {
              refreshData();
            });
          }
        },
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AspectRatio(
                    aspectRatio: 5 / 4,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(
                        _item[i]["img"],
                        height: 80,
                        fit: BoxFit.fitHeight
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    _item[i]["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                  Text(
                    "${_item[i]["quantity"]}, Price",
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500, color: Colors.grey),
                    softWrap: true,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${_item[i]["price"]}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            fontFamily: "Gilroy",
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(500)),
                            ),
                            onPressed: () {
                              _item = GetData().filterSearch(byItem: itemName,limit: 2);
                              setState(() {
                                _item[i]['favorite'] = GetData().addRemoveFavroite(_item[i]);
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              color: _item[i]['favorite'] ? Colors.red : Colors.grey,
                              size: 30,
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ))

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/app_icon_color.svg'
                ),
              ),
              const Center(
                child: Text(
                  'Khartonum,Sundan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.black.withOpacity(0.05),
                    filled: true,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    label: const Text('Search Store'),
                    labelStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        'assets/images/banner_background.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Image.asset(
                              'assets/images/banner_image.png',
                              fit: BoxFit.fitHeight,
                              height: 100,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left : 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Fresh Vegetables',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      fontFamily: 'Gilroy'
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      'Get Up To 40% OFF',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green,
                                        fontSize: 20
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  const Text(
                    'Exclusive Order',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        fontFamily: 'Gilroy',
                    ),
                    overflow: TextOverflow.visible,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterPage(name : 'fruit')));
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Gilroy',
                          color: Colors.green
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 340,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3/5,
                  ),
                  itemBuilder: (context, index) => getCard(index,'fruit'),
                  itemCount: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  const Text(
                    'Best Selling',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'Gilroy',

                    ),
                    overflow: TextOverflow.visible,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterPage(name : 'oil')));
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: 'Gilroy',
                          color: Colors.green
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                  width: double.infinity,
                  height: 340,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    childAspectRatio: 3/5,
                  ),
                  itemBuilder: (context, index) => getCard(index,'oil'),
                  itemCount: 2,

                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
