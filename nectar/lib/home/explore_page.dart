import 'package:flutter/material.dart';
import 'package:nectar/filter_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}
List<Map<dynamic,dynamic>> _item = [
  {
    "title" : 'Fresh Fruits',
    "img"  : "assets/images/categories_images/fruit.png",
    "name" : "fruit"
  },
  {
    "title" : 'Cooking Oil',
    "img"  : "assets/images/categories_images/oil.png",
    "name" : "oil"
  },
  {
    "title" : 'Meat & Fish',
    "img"  : "assets/images/categories_images/meat.png",
    "name" : "meat"
  },
  {
    "title" : 'Bakery & Snacks',
    "img"  : "assets/images/categories_images/bakery.png",
    "name" : "bakery"
  },
  {
    "title" : 'Dairy & Eggs',
    "img"  : "assets/images/categories_images/dairy.png",
    "name" : "dairy"
  },
  {
    "title" : 'Beverages',
    "img"  : "assets/images/categories_images/beverages.png",
    "name" : "beverages"
  }
];
final List<Color> _color = [
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.purple,
  const Color.fromRGBO(141, 130, 18, 1.0),
  Colors.blue,
];

class _ExplorePageState extends State<ExplorePage> {
  int currentItem = 0;

  List<Widget> getExpanded(int i) {
    List<Widget> list = [];
    for (int j = 0; j < 2 && j < _item.length ; j++) {
      list.add(Expanded(
          child: Container(
              padding: const EdgeInsets.all(5),
              // color: Colors.red,
              child: InkWell(
                onTap: () {
                  print("Name : ${_item[2 * i + j]["name"]}");
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FilterPage(name:_item[2*i+j]["name"])));
                },
                child: Card(
                    elevation: 0,
                    color: _color[currentItem].withOpacity(0.075),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: _color[currentItem].withOpacity(0.3),
                          width: 3,
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: 2/1,
                          child: Image.asset(
                            _item[currentItem]["img"],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Text(
                            _item[currentItem]["title"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            softWrap: true,
                          ),
                        ),
                      ],
                    )),
              ))));
      currentItem++;
    }
    return list;
  }

  List<Widget> getRow() {
    currentItem = 0;
    List<Widget> list1 = [];
    for (int i = 0; i < _item.length ~/ 2; i++) {
      list1.add(Expanded(child: Row(children: getExpanded(i))));
    }
    // print(list1);
    return list1;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    FocusNode myFocusNode = FocusNode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Find Products',
          style: TextStyle(
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
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.search,color: Colors.black,size: 27,),
                      label: Text('Search Store'),
                      labelStyle:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700
                          ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                  ),

                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: getRow(),
                ),
              ),
            ]),
      ),
    );
  }
}
