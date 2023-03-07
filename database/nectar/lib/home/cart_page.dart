import 'package:flutter/material.dart';
import 'package:nectar/data/data.dart';
import 'package:nectar/data/database.dart';
import 'package:nectar/home/detail_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Data> _item = [];
  bool isRefresh = false;
  bool loader = true;
  dynamic _totalAmount = 0;

  refreshData() {
    _totalAmount = 0;
    for (var element in _item)   {
      _totalAmount += element.price * element.cart;
    }
  }

  Future<List<Data>> loadList() async => await DataBase.cartItem();

  Widget getCard(int i) {
    var countCart = _item[i].cart;
    return Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withOpacity(0.1)),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () async {
                    isRefresh = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(item: _item[i]))) ??
                        false;
                    // isRefresh = isRefresh==null?false:true;
                    if (isRefresh) {
                      setState(() {
                        refreshData();
                        loader = true;
                      });
                    }
                  },
                  child: Image.asset(_item[i].img, fit: BoxFit.fitHeight),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              _item[i].title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                  overflow: TextOverflow.ellipsis),
                              overflow: TextOverflow.ellipsis,
                              // softWrap: true,
                              maxLines: 1,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await DataBase.removeCartItem(_item[i].id);
                              setState(() {
                                refreshData();
                                loader = true;
                              });
                            },
                            child: Icon(
                              Icons.clear,
                              size: 25,
                              color: Colors.grey.shade500,
                            ),
                          )
                        ],
                      ),
                      Text(
                        "${_item[i].quantity}, Price",
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 45,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (countCart > 0) {
                                      countCart -= 1;
                                    } else if (countCart == 0) {
                                      await DataBase.removeCartItem(_item[i].id);
                                      loader = true;
                                    }
                                    setState(() {
                                      DataBase.addCart(_item[i], countCart);
                                      refreshData();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
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
                                width: 50,
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
                                    setState(() {
                                      DataBase.addCart(_item[i], countCart);
                                      refreshData();
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: 0,
                                    side:
                                        BorderSide(color: Colors.grey.shade300),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15)), // <-- Radius
                                  ),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$${_item[i].price}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                fontFamily: "Gilroy"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget screenReturn() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 2 / 1),
            itemBuilder: (context, index) => getCard(index),
            itemCount: _item.length,
          ),
        ),
        Container(
          height: 110,
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ), // <-- Radius
            ),
            child: Row(
              children: [
                Expanded(child: Container()),
                const Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Go To Check Out",
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      "\$${_totalAmount.toStringAsFixed(2)}",
                      style: const TextStyle(),
                      // softWrap: false,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                )),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loader ? loadList() : null,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting &&
              snapshot.hasData) {
            _item = snapshot.data!;
            loader = false;

            if (_item.isEmpty) {
              return const Center(
                child: Text(
                  'Your Cart is Empty',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              );
            } else {
              refreshData();
              return screenReturn();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
