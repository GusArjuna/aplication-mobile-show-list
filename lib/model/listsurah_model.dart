import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Surah {
  int number;
  String latin;
  String jumlahayat;
  String nama;
  String tafsir;
  Surah({
    required this.number,
    required this.latin,
    required this.jumlahayat,
    required this.nama,
    required this.tafsir,
  });

  factory Surah.fromJson(Map<String, dynamic> object) {
    return Surah(
      number: object["data[number]"],
      latin: object["data[name[transliteration[id]]]"],
      jumlahayat: object["data[numberOfVerses]"],
      nama: object["data[nama[short]]"],
      tafsir: object["data[tafsir[id]]"],
    );
  }
  static Future<List<Surah>> connectToApi() async {
    String apiUrl = "https://api.quran.sutanlab.id/surah/";
    List<Surah> surah = [];
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = jsonDecode(apiResult.body);
    for (var i = 0; i < jsonObject.length; i++) {
      surah.add(Surah.fromJson(jsonObject[i]));
    }
    return surah;
  }
}
