import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:monitoring_timbal/parsing.dart';

class History extends StatefulWidget {
  @override
  final String filter;
  const History(this.filter);

  _HistoryState createState() => _HistoryState();
  static const routeName = '/History';
}

class _HistoryState extends State<History> {
  //https://eifrast.000webhostapp.com/api.php?tanggal=2021-08-06&wkt1=11:54:00&wkt2=11:55:00
  String link = "https://shell-less-span.000webhostapp.com/newapi.php";
  late String filter = widget.filter;
  late Future<Welcome> _futureWelcome;

  @override
  void initState() {
    super.initState();
    _futureWelcome = fetchWelcome();
  }

  Future<Welcome> fetchWelcome() async {
    final response = await http.get(Uri.parse(link + filter));
    if (response.statusCode == 200) {
      return Welcome.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data History"),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(children: <Widget>[
            Container(
              height: 700,
              child: FutureBuilder<Welcome>(
                  future: _futureWelcome,
                  builder: (context, snapshot) {
                    var state = snapshot.connectionState;
                    if (state != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (snapshot.hasData) {
                        return Container(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.status,
                              itemBuilder: (context, index) {
                                var data = snapshot.data?.data[index];
                                return Container(
                                    child: Card(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text("Pb "),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(" : "),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(data!.pb),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text("Tds "),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(" : "),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(data.tds),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text("Date "),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(" : "),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                  data.timefilter.toString()),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Text("Time "),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(" : "),
                                            ),
                                            Expanded(
                                              flex: 4,
                                              child: Text(data.time),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                              }),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Text('');
                      }
                    }
                  }),
            )
          ])),
        ));
  }
}
