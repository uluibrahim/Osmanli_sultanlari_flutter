import 'package:flutter/material.dart';
import 'dart:convert';
import 'detaylar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List tumSultanlar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Osmanlı Padişahları",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: FutureBuilder(
          future: veriKaynaginiOku(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              tumSultanlar = sonuc.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10,
                    color: Colors.teal.shade200,
                    margin: EdgeInsets.all(9),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detay(
                              desc: tumSultanlar[index]["detay"],
                              photo: tumSultanlar[index]["photo"],
                            ),
                          ),
                        );
                      },
                      leading: Image.network(
                        "${tumSultanlar[index]["photo"]}",
                        height: 50,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        tumSultanlar[index]["ad"],
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                      subtitle: Text(
                        tumSultanlar[index]["padisahlikDönemi"],
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: tumSultanlar.length,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Future<List> veriKaynaginiOku() async {
    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/sultanlar.json");
    List sultanlarListesi = json.decode(gelenJson.toString());
    return sultanlarListesi;
  }
}
