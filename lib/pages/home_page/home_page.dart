import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sushi_order/data/data.dart';
import 'dart:math' as math;
import '../../constants.dart';

final random = Random();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SushiListItem> sushiList  = [];

  late PageController _controller;
  double scrollOffset = 0.0;

  late SushiListItem _selectedItem;

  void populateItems() {
    if (sushiList.isNotEmpty) {
      return;
    }
    for (int i = 0; i < ImageUtils.sushiAssets.keys.length; i++) {
      sushiList .add(
        SushiListItem(
          name: ImageUtils.sushiAssets.keys.elementAt(i),
          price: 122.0 * (i + 1),
          size: SushiSize.values[random.nextInt(SushiSize.values.length)],
          startsCount: random.nextInt(5),
          ingredients: ImageUtils.sushiIngredientsAssets,
          image: ImageUtils.sushiAssets.values.elementAt(i),
        ),
      );
    }
  }

  @override
  initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: 0.645);
    _controller.addListener(() {
      setState(() => scrollOffset = _controller.page!);
    });
    populateItems();
    _selectedItem = sushiList.first;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.85,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(size.width / 2),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroundColor, cardColor.withOpacity(0.5)],
                  stops: [0.33, 1],
                ),
              ),
            ),
          ),
          PageView.builder(
              controller: _controller,
              itemCount: sushiList.length,
              itemBuilder: (context, index) {
                double alignment = math
                    .exp(-math.pow(scrollOffset - index, -4) / sushiList.length);
                bool fromLeft = scrollOffset.round() < index;
                final item = sushiList.elementAt(index);
                return Align(
                  alignment: Alignment(0, alignment),
                  child: Transform.rotate(
                    angle: fromLeft ? -alignment * 0.6 : alignment * -0.6,
                    child: Container(
                      width: 190 - alignment * 5,
                      height: 190 - alignment * 5,
                      //margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color: Colors.primaries[index],

                          image: DecorationImage(
                            image: AssetImage(item.image),
                          )),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
