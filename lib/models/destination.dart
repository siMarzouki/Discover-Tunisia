import 'slide.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Destination {
  String name;
  LatLng location;
  String goodToKnow;
  String transport;
  String shopping;
  List<Slide> slides;
  String img;
  Destination(
      {required this.name,
      required this.location,
      required this.goodToKnow,
      required this.transport,
      required this.shopping,
      required this.slides,
      required this.img});
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
        name: json["name"],
        location: LatLng(json['lat'], json['log']),
        goodToKnow: json["good"],
        shopping: json["shopping"],
        slides: (json['slides'] as List)
            .map((dynamic e) => Slide.fromJson(e as Map<String, dynamic>))
            .toList(),
        transport: json["transport"],
        img: json["img"]);
  }
}
