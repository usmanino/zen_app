// To parse this JSON data, do
//
//     final countrymodel = countrymodelFromJson(jsonString);

import 'dart:convert';

Countrymodel countrymodelFromJson(String str) =>
    Countrymodel.fromJson(json.decode(str));

String countrymodelToJson(Countrymodel data) => json.encode(data.toJson());

class Countrymodel {
  String? idNation;
  String? nation;
  int? idYear;
  String? year;
  int? population;
  String? slugNation;

  Countrymodel({
    this.idNation,
    this.nation,
    this.idYear,
    this.year,
    this.population,
    this.slugNation,
  });

  Countrymodel copyWith({
    String? idNation,
    String? nation,
    int? idYear,
    String? year,
    int? population,
    String? slugNation,
  }) =>
      Countrymodel(
        idNation: idNation ?? this.idNation,
        nation: nation ?? this.nation,
        idYear: idYear ?? this.idYear,
        year: year ?? this.year,
        population: population ?? this.population,
        slugNation: slugNation ?? this.slugNation,
      );

  factory Countrymodel.fromJson(Map<String, dynamic> json) => Countrymodel(
        idNation: json["ID Nation"],
        nation: json["Nation"],
        idYear: json["ID Year"],
        year: json["Year"],
        population: json["Population"],
        slugNation: json["Slug Nation"],
      );

  Map<String, dynamic> toJson() => {
        "ID Nation": idNation,
        "Nation": nation,
        "ID Year": idYear,
        "Year": year,
        "Population": population,
        "Slug Nation": slugNation,
      };
}
