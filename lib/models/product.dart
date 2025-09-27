import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String summary;
  final int price;
  final String desc;
  final Color color;

  const Product({
    required this.id,
    required this.title,
    required this.summary,
    required this.price,
    required this.desc,
    required this.color,
  });

  @override
  List<Object?> get props => [id, title, summary, price, desc, color];

  Product copyWith({
    String? id,
    String? title,
    String? summary,
    int? price,
    String? desc,
    Color? color,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      price: price ?? this.price,
      desc: desc ?? this.desc,
      color: color ?? this.color,
    );
  }
}
