import 'package:flutter/material.dart';
import 'dart:convert';



class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List tumSultanlar;

  @override
  void initState() {
    
    super.initState();  
    veriKaynaginiOku().then((gelenSultanlarListesi){
      tumSultanlar=gelenSultanlarListesi;
    });

  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Osmanlı Padişahları"),
      ),
      body:  tumSultanlar != null ?  Center(
     
        child: Container(
          child: ListView.builder(itemBuilder: (context,index){
            return Card(
              color: Colors.orange.shade400,
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Icon(Icons.image),
                title: Text(tumSultanlar[index]["ad"]),
                subtitle: Text("bilgi"),
              ),
            );
          },
          itemCount: tumSultanlar.length,
          ),
        ),
      ): Center(child: CircularProgressIndicator()),
     
    );
  }



  Future<List> veriKaynaginiOku() async {

      var gelenJson=await DefaultAssetBundle.of(context).loadString("assets/data/sultanlar.json");

      debugPrint(gelenJson);

      List sultanlarListesi=json.decode(gelenJson.toString());

      return sultanlarListesi;
  }
}


