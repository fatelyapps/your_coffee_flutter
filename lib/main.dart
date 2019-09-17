import 'package:flutter/material.dart';

import 'data/caffeeModel.dart';
import 'data/dataSource.dart';
import 'util/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kávé választó',
      theme: ThemeData(
          primarySwatch: Colors.brown,
          textTheme: TextTheme(
            subtitle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 34.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontStyle: FontStyle.normal),
          )),
      home: CaffeeHomePage(),
    );
  }
}

class CaffeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kávé választó"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
        ],
      ),
      backgroundColor: HexColor("bcaaa4"),
      body: GridView.count(
        crossAxisCount: MediaQuery.of(context).size.shortestSide < 600
            ? 2
            : 3, //tablet vs phone
        children: List.generate(CAFFEE_LIST_DATA.length, (index) {
          return Container(
              color: HexColor("bcaaa4"),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CaffeeDetailPage(CAFFEE_LIST_DATA[index])),
                    );
                  },
                  child: Card(
                    color: HexColor("d7ccc8"),
                    margin: EdgeInsets.all(16),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/' + CAFFEE_LIST_DATA[index].imgName,
                            fit: BoxFit.contain,
                          ),
                          Text(
                            CAFFEE_LIST_DATA[index].name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle,
                          )
                        ],
                      ),
                    ),
                  )));
        }),
      ),
    );
  }
}

class CaffeeDetailPage extends StatelessWidget {
  final CaffeeModel data;

  CaffeeDetailPage(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data.name),
        ),
        backgroundColor: HexColor("bcaaa4"),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/images/' + data.imgName,
                    fit: BoxFit.contain,
                    width: 255,
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          title: Text(
                        data.shortDescription,
                      ))
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(title: Text(data.howDescription)),
                    ],
                  ),
                ),
                Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                          leading: Icon(
                            Icons.local_cafe,
                            color: Colors.brown,
                            size: 30.0,
                          ),
                          title: Text("A kávéról")),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(data.longDescription,
                            style: Theme.of(context).textTheme.body1),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class AboutPage extends StatelessWidget {
  AboutPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App részletek"),
        ),
        backgroundColor: HexColor("bcaaa4"),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Card(
                    child: ListTile(
                      title: Text("Az alkalmazás"),
                      subtitle: Text(
                          "Saeco PicoBaristo Automata eszpresszó kávéfőző SM3061/10 által elkésztihető recepteket tartalmazza."),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Card(
                    child: ListTile(
                      title: Text("Felhasznált információk és képek"),
                      subtitle: Text(
                          "A Phillips weboldalán található Különféle kávéfajták és kérdések oldalán megtalált információk és képek."),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Card(
                    child: ListTile(
                      title: Text("A fejlesztő"),
                      subtitle: Text(
                          "Fately Apps (Horváth Ádám) első Flutter teszt applikációja"),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
