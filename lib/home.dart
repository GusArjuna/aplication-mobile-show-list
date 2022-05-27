import 'package:flutter/material.dart';
import 'package:ujian_ptm/detailsurah.dart';
import 'package:ujian_ptm/listsurah.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ujian Praktikum PTM 1461900089 M. Taufan Ma'ruf"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                "About Me",
                style: TextStyle(fontSize: 35),
              ),
              Image.asset(
                "assets/images/dirikubiru.jpg",
                width: 100,
                height: 200,
              ),
              Text(
                "Nama : M. Taufan Ma'ruf",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "NBI : 1461900089",
                style: TextStyle(fontSize: 20),
              ),
              RaisedButton(
                child: Text("Dashboard"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListSurahTampilan(),
                  ));
                },
                color: Colors.yellow,
              )
            ],
          ),
        ));
  }
}
