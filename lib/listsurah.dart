import 'package:flutter/material.dart';
import 'package:ujian_ptm/detailsurah.dart';
import 'package:ujian_ptm/home.dart';
import 'package:ujian_ptm/model/listsurah_model.dart';

class ListSurahTampilan extends StatefulWidget {
  const ListSurahTampilan({Key? key}) : super(key: key);

  @override
  _ListSurahTampilanState createState() => _ListSurahTampilanState();
}

class _ListSurahTampilanState extends State<ListSurahTampilan> {
  List<Surah> listSurah = [];
  _getSurah() async {
    await Surah.connectToApi().then((value) => listSurah = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Surah"),
      ),
      body: FutureBuilder(
        future: _getSurah(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return (snapshot.hasError)
                  ? Text('Error: ${snapshot.error}')
                  : ListView.builder(
                      itemCount: listSurah.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(listSurah[index].nama),
                                Text(listSurah[index].tafsir),
                                RaisedButton(
                                    child: Text("Details"),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailSurahTampilan(
                                            jumlahAyats:
                                                listSurah[index].jumlahayat,
                                            latins: listSurah[index].latin,
                                            namasur: listSurah[index].nama,
                                            tafsirs: listSurah[index].tafsir,
                                          ),
                                        ),
                                      );
                                    })
                              ],
                            ),
                            RaisedButton(
                                child: Text("Kembail"),
                                onPressed: () {
                                  Navigator.of(context).pop(
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                })
                          ],
                        );
                      });
          }
        },
      ),
    );
  }
}
