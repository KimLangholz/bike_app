import 'package:flutter/material.dart';

class PinInformation {
  String id;
  String address;
  String imagePath;
  int availableSpots;
  Color labelColor;
  PinInformation(
      {this.id,
      this.address,
      this.imagePath,
      this.availableSpots,
      this.labelColor});
}