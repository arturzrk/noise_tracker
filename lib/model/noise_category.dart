import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoiseCategory {
  DocumentReference reference;
  String name;
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
  NoiseCategory({this.reference, this.name, this.color});
}

