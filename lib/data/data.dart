class ImageUtils {
  static const sushiAssets = <String, String>{
    'Sushi Caridea': 'lib/assets/images/dish/1.png',
    'California Roll': 'lib/assets/images/dish/2.png',
    'California Roll II': 'lib/assets/images/dish/3.png',
    'Sashimi Sushi': 'lib/assets/images/dish/4.png',
    'Roll Milticolor': 'lib/assets/images/dish/5.png',
    'Sashimi Sushi I': 'lib/assets/images/dish/6.png',
    'Sashimi Sushi II': 'lib/assets/images/dish/7.png',
    'Makizushi Sushi': 'lib/assets/images/dish/8.png',
  };

  static const sushiIngredientsAssets = <String>[
    'lib/assets/images/dish/makizushi.png',
    'lib/assets/images/dish/ras el hanout.png',
    'lib/assets/images/dish/soja.png',
    'lib/assets/images/dish/wasabi.png',
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
