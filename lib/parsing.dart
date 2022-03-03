import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.status,
        required this.message,
        required this.data,
    });

    int status;
    String message;
    List<Datum> data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
      required this.tds,
      required this.pb,
      required this.time,
      required this.timestamp,
      required this.timefilter,
    });

    String tds;
    String pb;
    String time;
    DateTime timestamp;
    DateTime timefilter;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        tds: json["tds"],
        pb: json["pb"],
        time: json["time"],
        timestamp: DateTime.parse(json["timestamp"]),
        timefilter: DateTime.parse(json["timefilter"]),
    );

    Map<String, dynamic> toJson() => {
        "tds": tds,
        "pb": pb,
        "time": time,
        "timestamp": timestamp.toIso8601String(),
        "timefilter": "${timefilter.year.toString().padLeft(4, '0')}-${timefilter.month.toString().padLeft(2, '0')}-${timefilter.day.toString().padLeft(2, '0')}",
    };
}
