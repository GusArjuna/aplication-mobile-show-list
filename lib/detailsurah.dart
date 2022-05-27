import 'package:flutter/material.dart';

class DetailSurahTampilan extends StatelessWidget {
  String namasur;
  String jumlahAyats;
  String tafsirs;
  String latins;
  DetailSurahTampilan(
      {Key? key,
      required this.jumlahAyats,
      required this.latins,
      required this.namasur,
      required this.tafsirs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Surah"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("nama : ${namasur}", style: TextStyle(fontSize: 15)),
          Text("Jumlah Ayat : ${jumlahAyats}", style: TextStyle(fontSize: 15)),
          Text("Latin ${latins}", style: TextStyle(fontSize: 15)),
          Text("Tafsir : ${tafsirs}", style: TextStyle(fontSize: 15)),
        ],
      )),
    );
  }
}
