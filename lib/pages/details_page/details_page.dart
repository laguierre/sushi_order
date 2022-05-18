import 'package:flutter/material.dart';
import 'package:sushi_order/constants.dart';
import 'package:sushi_order/data/data.dart';
import '../home_page/home_page_widgets.dart';
import 'details_page_widgets.dart';

class SushiDetailsPage extends StatelessWidget {
  const SushiDetailsPage({Key? key, required this.item}) : super(key: key);
  final SushiListItem item;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final backgroundCardSize = size.height * 0.85;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            BackgroundColorContainer(size: size, backgroundCardSize: backgroundCardSize),
            ImageDetails(item: item),
            DishInfo(size: size, item: item),
            Positioned(
                top: backgroundCardSize,
                left: size.width / 2 - 50 / 2,
                child: GestureDetector(onTap: () {}, child: const ActionBtn())),
            MyAppBar(title: item.name, isDetailsPage: true)
          ],
        ),
      ),
    );
  }
}


