import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String summary;
  final int price;
  final String desc;
  final Color color;

  Product({
    required this.id,
    required this.title,
    required this.summary,
    required this.price,
    required this.desc,
    required this.color,
  });
}
