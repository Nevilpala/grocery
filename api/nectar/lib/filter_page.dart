import 'package:flutter/material.dart';
import 'package:nectar/data/api.dart';
import 'package:nectar/data/api_service.dart';
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
  bool loader = true;
  var _item = [];
  final ApiService api = ApiService();
  dynamic name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    refreshData();
  }
  Future<List<Data>> loadList() async => await api.filterSearch(byItem: name);


  refreshData() async {
    loader = true;
    currentItem = 0;
  }

  Widget getCard(int i) {
    return Container(
        // height: 500,
        padding: const EdgeInsets.all(5),
        child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () async {
              isRefresh = await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(item: _item[i], index: i))) ??
                  false;
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
                            _item[i].img,
                            width: 75,
                            height: 100,
                            // fit: BoxFit.
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _item[i].title,
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
                          "${_item[i].quantity}, Price",
                          style:
                              const TextStyle(fontSize: 20, color: Colors.grey),
                          softWrap: true,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${_item[i].price}",
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
                                    api.addRemoveFavroite(_item[i]);
                                  });
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: _item[i].favorite == true
                                      ? Colors.red
                                      : Colors.grey,
                                  size: 30,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ))));
  }

  Widget screenReturn() {

      return Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: loader ?  loadList() : null,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.hasData) {
                  _item = snapshot.data!;
                  loader = false;
                  if (_item.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Data Found',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 5,
                      ),
                      itemBuilder: (context, index) => getCard(index),
                      itemCount: _item.length,
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name.toString()[0].toUpperCase() + name.toString().substring(1),
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
