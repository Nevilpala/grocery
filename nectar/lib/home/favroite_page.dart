import 'package:flutter/material.dart';
import 'package:nectar/data/data.dart';
import 'package:nectar/home/detail_page.dart';

// ignore: must_be_immutable
class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();

}

class _FavoritePageState extends State<FavoritePage> {
  int currentItem = 0;
  bool isRefresh = false;
  List<Map<dynamic, dynamic>> _item = [];
  @override
  void initState() {
    print("============================= Init Called ==================================");
    // TODO: implement initState
    super.initState();
    refreshData();
  }

  void refreshData() {
    print("======================== Refresh Data Page ==================================");
    _item = GetData().favoriteItem();
    currentItem = 0;
  }


  Widget getCard(int i) {
    var currentItem = i;
    return Container(
      // height: 500,
        padding: const EdgeInsets.all(5),
        child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () async {
              isRefresh = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(item: _item[i])))??false;
              // isRefresh = isRefresh==null?false:true;

              if (isRefresh) {
                print("refresh : $isRefresh");
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 5 / 4,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset(
                            _item[i]["img"],
                            width: 75,
                            height: 100,
                            // fit: BoxFit.
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25,),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _item[currentItem]["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${_item[i]["quantity"]}, Price",
                          style:
                          const TextStyle(fontSize: 20, color: Colors.grey),
                          softWrap: true,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${_item[i]["price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                fontFamily: "Gilroy"),
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
                                  setState(() {
                                    _item[i]['favorite'] = GetData().addRemoveFavroite(_item[i]);
                                    refreshData();
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
                ))));
  }

  Widget screenReturn() {
    if (_item.isEmpty) {
      return const Center(
        child: Text(
          'Favorite Item is Empty',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Center(
                child: Text(
                  "Favorite Item",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            Expanded(
              child:  GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 5,
                  // crossAxisSpacing: 20,
                  // mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) => getCard(index),
                itemCount: _item.length,
              ),
            ),
          ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screenReturn(),
      ),
    );
  }
}
