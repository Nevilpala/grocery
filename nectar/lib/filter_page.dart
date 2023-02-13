import 'package:flutter/material.dart';
import 'package:nectar/data/data.dart';
import 'package:nectar/home/detail_page.dart';


// ignore: must_be_immutable
class FilterPage extends StatefulWidget {
  dynamic name;
  FilterPage({Key? key, this.name}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int currentItem = 0;
  bool isRefresh = false;
  List<Map<dynamic, dynamic>> _item = [];
  var data = GetData();
  dynamic name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    refreshData();
  }

  void refreshData() {
    _item = data.filterSearch(byItem: name);
    currentItem = 0;
  }

  Widget getCard(int i) {

    return Container(
        // height: 500,
        padding: const EdgeInsets.all(5),
        child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () async {
              isRefresh = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(item: _item[i], index: i)
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
                            _item[i]["title"],
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
                                    _item[i]['favorite'] = data.addRemoveFavroite(_item[i]);
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: _item[i]['favorite']==true ? Colors.red : Colors.grey,
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

  // List<Widget> getRow() {
  //   currentItem = 0;
  //   List<Widget> list1 = [];
  //   int len = _item.length ==1 ? _item.length: _item.length ~/ 2;
  //   for (int i = 0; i < len; i++) {
  //     list1.add(SizedBox(height: 300, child: Row(children: getExpanded(i))));
  //   }
  //   return list1;
  //   return [];
  // }

  Widget screenReturn() {
    if (_item.isEmpty) {
      return const Center(
        child: Text(
          'No Data Found',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      return Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 15),
            //   child: Center(
            //     child: Text(
            //       name[0].toUpperCase() + name.substring(1),
            //       style: const TextStyle(
            //           fontWeight: FontWeight.bold, fontSize: 25),
            //     ),
            //   ),
            // ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 5,

                  ),
                itemBuilder: (context, index) => getCard(index),
                itemCount: _item.length,
              ),
            ),
          ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name[0].toUpperCase() + name.substring(1),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Gilroy',
              fontSize: 25,
          ),

        ),
        centerTitle: true,
        elevation: 0.00,
        backgroundColor: Colors.white.withOpacity(0.5),
        foregroundColor: Colors.black,
        toolbarHeight: 65,

      ),
      body: SafeArea(
        child: screenReturn(),
      ),
    );
  }
}
