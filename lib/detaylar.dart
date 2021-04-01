import 'package:flutter/material.dart';

class Detay extends StatelessWidget {
  final desc;
  final photo;

  Detay({this.desc, this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: 1, left: 1, right: 1),
            children: [
              Image.network(photo.toString(),
                  width: 200, height: 300, fit: BoxFit.fill),
              Container(
                color: Colors.deepOrange.shade50,
                padding: EdgeInsets.all(15),
                child: Text(
                  desc,
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
