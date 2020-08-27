import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "GRID dan HERO",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarItem = new List();

  var karakter = [
    {"nama": "Kebaya 1", "gambar": "abc1.jpg"},
    {"nama": "Kebaya 2", "gambar": "abc2.jpg"},
    {"nama": "Kebaya 3", "gambar": "abc3.jpg"},
    {"nama": "Kebaya 4", "gambar": "abc4.jpg"},
    {"nama": "Kebaya 5", "gambar": "abc5.jpg"},
    {"nama": "Kebaya 6", "gambar": "abc6.jpg"},
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];

      daftarItem.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              color: Colors.brown,
              child: new Column(
                children: <Widget>[
                  new Hero(
                    tag: karakternya['nama'],
                    child: new Material(
                      child: new InkWell(
                        highlightColor: Colors.amber,
                        onTap: () =>
                            Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Detail(
                            nama: karakternya['nama'],
                            gambar: gambar,
                          ),
                        )),
                        child: new Image.asset(
                          "img/$gambar",
                          height: 120,
                          width: 200,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Text(
                    karakternya['nama'],
                    style: new TextStyle(color: Colors.white, fontSize: 10.0),
                  )
                ],
              ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFE9E7DA),
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text(
          "Merupa Gallery",
          style: new TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarItem,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFE9E7DA),
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Hero(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.brown),
                ),
                new Text(
                  "$nama\ Merupa By Yoela Meidiana",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Iconteks(
            icon: Icons.call,
            teks: "Call",
          ),
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.brown,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.brown),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Deskripsi Item",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
