import 'package:flutter/material.dart';

import '../data/api.dart';
import '../data/api_service.dart';

// ignore: must_be_immutable
class Demo extends StatefulWidget {
  String? title;

  Demo({Key? key, this.title}) : super(key: key);
  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final ApiService api = ApiService();
  late List<Data> casesList = <Data>[];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        // child:  Center(
            child:  FutureBuilder(
              future: loadList(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: casesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Card(
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => DetailWidget(cases[index])),
                                  // );
                                },
                                child: Column(
                                  children: [
                                    Text('${casesList[index].id}'),
                                    Text(casesList[index].title),
                                    Text(casesList[index].img),
                                    Text('${casesList[index].price}'),
                                    Text(casesList[index].quantity),
                                    Text(casesList[index].item),
                                  ],
                                )
                              )
                          );
                      });

                }
                else{
                  return const Center(child: CircularProgressIndicator());
                }
                 // Center(child:  Text('No data found, tap plus button to add!', style: Theme.of(context).textTheme.title));
             },
            )
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _navigateToAddScreen(context);
          api.createCase(casesList[0]);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Data>> futureData = api.getData();
    futureData.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
    print(futureData);
    return futureData;
  }

  // _navigateToAddScreen (BuildContext context) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddDataWidget()),
  //   );
  // }
}
