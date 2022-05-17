import 'package:flutter/material.dart';

class ImageUtils {
  static const sushiAssets = <String, String>{
    'Sushi Caridea': 'assets/images/dish/1.png',
    'California Roll': 'assets/images/dish/2.png',
    'California Roll II': 'assets/images/dish/3.png',
    'Sashimi Sushi': 'assets/images/dish/4.png',
    'China Roll California': 'assets/images/dish/5.png',
    'Sashimi Sushi I': 'assets/images/dish/6.png',
    'Sashimi Sushi II': 'assets/images/dish/7.png',
    'Makizushi Sushi Pizza': 'assets/images/dish/8.png',
  };

  static const sushiIngredientsAssets = <String>[
    'assets/images/dish/makizushi.png',
    'assets/images/dish/ras el hanout.png',
    'assets/images/dish/soja.png',
    'assets/images/dish/wasabi.png',
  ];
}

class SushiListItem {
  final double price;
  final List<String> ingredients;
  final int startsCount;
  final String name;
  final String image;
  final SushiSize size;

  SushiListItem({
    required this.size,
    required this.image,
    required this.ingredients,
    required this.name,
    required this.price,
    required this.startsCount,
  });
}

enum SushiSize {
  S,
  M,
  L,
}
