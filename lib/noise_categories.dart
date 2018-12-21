import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class NoiseCategory {
  final name;
  final Color color;
  static List<NoiseCategory> configuredCategories = [
    NoiseCategory(name: "Normal work", color: Colors.green),
    NoiseCategory(name: "Disruption 1"),
    NoiseCategory(name: "Coffe break"),
    NoiseCategory(name: "toilet"),
    NoiseCategory(name: "telephone call"),
    NoiseCategory(name: "leg stretching"),
    NoiseCategory(name: "sms"),
  ];
  NoiseCategory({@required this.name, this.color});
}

