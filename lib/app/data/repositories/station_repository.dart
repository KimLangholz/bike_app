import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'station_repository.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Station {
  /*final String id;
  final String address;
  final double lat;
  final double lng;
  final String img;
*/
  Station({
    this.id,
    this.address,
    this.lat,
    this.lng,
    this.img,
  });

  /*factory Station.fromJson(Map<String, dynamic> json) {
    return new Station(
        id: json['id'] as String,
        address: json['address'] as String,
        lat: json['lat'] as double,
        lng: json['lng'] as double,
        img: json['img'] as String);
  }*/

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);
  Map<String, dynamic> toJson() => _$StationToJson(this);

  final String id;
  final String address;
  final double lat;
  final double lng;
  final String img;
}

@JsonSerializable()
class Locations {
  Locations({
    this.stations,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Station> stations;
}

Future<String> _loadJsonAsset() async {
  print(1);
  return await rootBundle.loadString('assets/stationsTest.json');
}

Future<Locations> getBikeStations() async {
  String jsonData = await _loadJsonAsset();
  print(2);

  print(jsonData);
  print(3);

  return Locations.fromJson(json.decode(jsonData));
}
