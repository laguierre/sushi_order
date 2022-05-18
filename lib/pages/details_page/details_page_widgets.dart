import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/data.dart';
import '../home_page/home_page_widgets.dart';

class DishInfo extends StatelessWidget {
  const DishInfo({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  final Size size;
  final SushiListItem item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.49),
        child: SushiListItemInfoWidget(
          item: item,
          isDetailsPage: true,
        ),
      ),
    );
  }
}

class ImageDetails extends StatelessWidget {
  const ImageDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SushiListItem item;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.5),
      child: Hero(
        tag: ObjectKey(item.name),
        child: Container(
          alignment: Alignment.center,
          width: 250,
          height: 250,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image),
              )),
        ),
      ),
    );
  }
}

class BackgroundColorContainer extends StatelessWidget {
  const BackgroundColorContainer({
    Key? key,
    required this.size,
    required this.backgroundCardSize,
  }) : super(key: key);

  final Size size;
  final double backgroundCardSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size.width * 0.85,
        height: backgroundCardSize,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundColor, cardColor.withOpacity(0.5)],
            stops: const [0.33, 1],
          ),
        ),
      ),
    );
  }
}