import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sushi_order/data/data.dart';
import 'dart:math' as math;
import '../../constants.dart';
import '../details_page/details_page.dart';
import 'home_page_widgets.dart';

final random = Random();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<SushiListItem> sushiList = [];

  late PageController _controller;
  double scrollOffset = 0.0;

  late SushiListItem selectedItem;

  void populateItems() {
    if (sushiList.isNotEmpty) {
      return;
    }
    for (int i = 0; i < ImageUtils.sushiAssets.keys.length; i++) {
      sushiList.add(
        SushiListItem(
          name: ImageUtils.sushiAssets.keys.elementAt(i),
          image: ImageUtils.sushiAssets.values.elementAt(i),
          startsCount: random.nextInt(6),
          price: 126.0 + random.nextInt(8),
          size: SushiSize.values
              [random.nextInt(SushiSize.values.length)],
          ingredients: ImageUtils.sushiIngredientsAssets,
        ),
      );
    }
  }

  void navigateToDetailsPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => SushiDetailsPage(
                  item: selectedItem,
                )));
  }

  @override
  initState() {
    super.initState();
    _controller = PageController(initialPage: 0, viewportFraction: 0.645);
    _controller.addListener(() {
      setState(() => scrollOffset = _controller.page!);
    });
    populateItems();
    selectedItem = sushiList.first;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final backgroundCardSize = size.height * 0.85;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Stack(
          children: [
            Center(
              child: Container(
                width: size.width * 0.8,
                height: backgroundCardSize,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(size.width / 2),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [backgroundColor, cardColor.withOpacity(0.5)],
                    stops: const [0.33, 1],
                  ),
                ),
              ),
            ),
            PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  selectedItem = sushiList[index];
                },
                controller: _controller,
                itemCount: sushiList.length,
                itemBuilder: (context, index) {
                  double alignment = math.exp(
                      -math.pow(scrollOffset - index, -4) / sushiList.length);
                  bool fromLeft = scrollOffset.round() < index;
                  final item = sushiList.elementAt(index);
                  return Align(
                    alignment: Alignment(0, alignment),
                    child: Transform.rotate(
                      angle: fromLeft ? -alignment * 0.6 : alignment * -0.6,
                      child: GestureDetector(
                        onTap: () {
                          navigateToDetailsPage(context);
                        },
                        child: Hero(
                          tag: ObjectKey(item.name),
                          child: Container(
                            alignment: Alignment.center,
                            width: 190 - alignment * 5,
                            height: 190 - alignment * 5,
                            //margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(item.image),
                            )),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: size.height * 0.63),
                child: SushiListItemInfoWidget(
                  item: selectedItem,
                ),
              ),
            ),
            _FAB(backgroundCardSize, size, context),
            const MyAppBar(title: 'Order Normally')
          ],
        ),
      ),
    );
  }

  Positioned _FAB(double backgroundCardSize, Size size, BuildContext context) {
    return Positioned(
              top: backgroundCardSize,
              left: size.width / 2 - 50 / 2,
              child: GestureDetector(
                  onTap: () {
                    navigateToDetailsPage(context);
                  },
                  child: const ActionBtn()));
  }
}


