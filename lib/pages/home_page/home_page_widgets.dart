import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/data.dart';

class SushiListItemInfoWidget extends StatelessWidget {
  const SushiListItemInfoWidget({
    Key? key,
    required this.item,
    this.isDetailsPage = false,
  }) : super(key: key);
  final SushiListItem item;
  final bool isDetailsPage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!isDetailsPage)
          Text(
            item.name,
            style: Theme.of(context).textTheme.headline4?.copyWith(
              color: Colors.white70,
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              bool selected = index <= item.startsCount;
              return Icon(
                Icons.star,
                size: 20,
                color: selected ? Colors.white70 : Colors.white24,
              );
            }),
          ),
        ),
        TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: item.price),
            duration: const Duration(milliseconds: 500),
            builder: (context, price, child) {
              return Text('\$${price.toInt()}',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white));
            }),
        Padding(
          padding: EdgeInsets.only(
              bottom: 18,
              top: 18,
              left: size.width * 0.25,
              right: size.width * 0.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: SushiSize.values.map((size) {
              String name = '';
              switch (size) {
                case SushiSize.S:
                  name = 'S';
                  break;
                case SushiSize.L:
                  name = 'L';
                  break;
                case SushiSize.M:
                  name = 'M';
                  break;
              }
              return AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: size == item.size ? Colors.white : Colors.white30),
                child: Text(
                  name,
                ),
              );
            }).toList(),
          ),
        ),
        if (isDetailsPage)
          SizedBox(
            height: 100,
            width: size.width * 0.77,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: item.ingredients
                  .map((ingredientPath) => Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(8)
                ), child: Image.asset(ingredientPath),
              ))
                  .toList(),
            ),
          )
      ],
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.title,
    this.isDetailsPage = false,
  }) : super(key: key);
  final String title;
  final bool isDetailsPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SizedBox(
        height: 90,
        child: Row(
          children: [
            if (isDetailsPage) const BackButton(color: Colors.white),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 10),
                if (!isDetailsPage)
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5),
                      Text('Tandil, Buenos Aires',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white))
                    ],
                  )
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  const ActionBtn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.whatshot,
        size: 36,
        color: cardColor,
      ),
    );
  }
}