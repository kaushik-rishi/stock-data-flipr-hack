// To parse this JSON data, do
//
//     final nseModel = nseModelFromJson(jsonString);

import 'dart:convert';

List<NseModel?>? nseModelFromJson(String str) => json.decode(str) == null
    ? []
    : List<NseModel?>.from(json.decode(str)!.map((x) => NseModel.fromJson(x)));

String nseModelToJson(List<NseModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class NseModel {
  NseModel({
    this.dated,
    this.opened,
    this.high,
    this.low,
    this.closed,
    this.adjClose,
    this.volume,
  });

  DateTime? dated;
  double? opened;
  double? high;
  double? low;
  double? closed;
  double? adjClose;
  int? volume;

  factory NseModel.fromJson(Map<String, dynamic> json) => NseModel(
        dated: DateTime.parse(json["dated"]),
        opened: json["opened"].toDouble(),
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        closed: json["closed"].toDouble(),
        adjClose: json["adj_close"].toDouble(),
        volume: json["volume"],
      );

  Map<String, dynamic> toJson() => {
        "dated": dated?.toIso8601String(),
        "opened": opened,
        "high": high,
        "low": low,
        "closed": closed,
        "adj_close": adjClose,
        "volume": volume,
      };
}
