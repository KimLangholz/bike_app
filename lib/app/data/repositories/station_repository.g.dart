// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

Station _$StationFromJson(Map<String, dynamic> json) {
  return Station(
      id: json['id'] as String,
      address: json['address'] as String,
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble(),
      img: json['image'] as String);
}

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'img': instance.img
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) {
  return Locations(
      stations: (json['stations'] as List)
          ?.map((e) =>
              e == null ? null : Station.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LocationsToJson(Locations instance) =>
    <String, dynamic>{'stations': instance.stations};
