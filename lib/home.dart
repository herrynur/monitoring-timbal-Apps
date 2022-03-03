import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:monitoring_timbal/history.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  var tds;
  var pb;
  String tanggal = "-";
  late List<String> tanggal_s;
  String jam = "-";
  late List<String> jam_s;
  String jam_1 = "-";
  late List<String> jam_s_1;
  String filter = "-";

  final databaseReference =
      FirebaseDatabase.instance.reference().child("data/tabel_1");

  @override
  initState() {
    databaseReference.once().then((DataSnapshot snapshot) {
      setState(() {
        tds = snapshot.value["sek"];
        pb = snapshot.value["sek2"];
      });
    });
  }

  void load() {
    databaseReference.once().then((DataSnapshot snapshot) {
      setState(() {
        tds = snapshot.value["sek"];
        pb = snapshot.value["sek2"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    load();
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Monitoring Timbal",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]),
                ),
                subtitle: Text("PDAM Mojoagung"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  color: Colors.grey[300],
                  height: 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Stack(
                        children: <Widget>[
                          Container(
                            child: Image.asset("assets/bg.jpg"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                            child: Container(
                              child: Text(
                                "Monitoring Timbal",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Data Monitoring",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "Sensor TDS",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Icon(
                                                      Icons.water,
                                                      color: Colors.blue,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      child: Text(
                                                    "$tds",
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              "Perhitungan PB",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .waterfall_chart_rounded,
                                                      color: Colors.orange,
                                                      size: 30.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Container(
                                                      child: Text(
                                                    "$pb",
                                                    style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ],
                                              ),
                                            ))
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Card(
                    child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Data History",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Container(
                        color: Colors.grey[300],
                        height: 2,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "date : $tanggal",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        child: Text("Select Date"),
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2018, 3, 5),
                              maxTime: DateTime(2030, 6, 7),
                              theme: DatePickerTheme(
                                  headerColor: Colors.grey,
                                  backgroundColor: Colors.white,
                                  itemStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  doneStyle: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              tanggal = date.toString();
                              tanggal_s = tanggal.split(" ");
                              tanggal = tanggal_s[0];
                            });
                          },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en);
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "time start : $jam",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        child: Text("Select Time Start"),
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              jam = date.toString();
                              jam_s = jam.split(" ");
                              jam = jam_s[1];
                            });
                          }, currentTime: DateTime.now());
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Time End : $jam_1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        child: Text("Select Time End"),
                        onPressed: () {
                          DatePicker.showTimePicker(context,
                              showTitleActions: true,
                              onChanged: (date) {}, onConfirm: (date) {
                            setState(() {
                              jam_1 = date.toString();
                              jam_s_1 = jam_1.split(" ");
                              jam_1 = jam_s_1[1];
                            });
                          }, currentTime: DateTime.now());
                        },
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Lihat Data History"),
                      onPressed: () {
                        setState(() {
                          filter = "?tanggal=" +
                              tanggal +
                              "&wkt1=" +
                              jam +
                              "&wkt2=" +
                              jam_1;
                        });
                        Navigator.pushNamed(context, History.routeName,
                            arguments: filter);
                      },
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
