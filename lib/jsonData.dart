import 'dart:convert';

List<Billionaire> billionaireFromJson(String str) => List<Billionaire>.from(
    json.decode(str).map((x) => Billionaire.fromJson(x)));

String billionaireToJson(List<Billionaire> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Billionaire {
  Billionaire({
    this.personName,
    this.source,
    this.rank,
  });

  int rank;
  String personName;
  String source;

  factory Billionaire.fromJson(Map<String, dynamic> json) => Billionaire(
        rank: json["rank"],
        personName: json["personName"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "personName": personName,
        "source": source,
      };
}
