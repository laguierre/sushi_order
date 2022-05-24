# Sushi Challenge Tutorial App Flutter 

Beautiful Tutorial of a Sushi order demo Flutter App; using Hero, Transform, PageView, etc. 
The Tuturial is in the Pedro Massango's Youtube Channel [link](https://www.youtube.com/watch?v=jCYXs5nn3_k) and inspired in Dribbble link [link](https://dribbble.com/shots/15304774--Sushi-order-system).
- PageView.builder.
- Align
- Transform.rotate
- For the efect of the sushi dish traslate
```C
  double alignment = math.exp(-math.pow(scrollOffset - index, -4) / sushiList.length);
  bool fromLeft = scrollOffset.round() < index;
```
where "index" is the index for the PageView.builder. "fromLeft" is to detect de direction of the scroll to have symmetric animation in booth direction.
And "scrollOffset = _controller.page".
- TweenAnimationBuilder
- AnimatedDefaultTextStyle.
- AnimatedContainer for make a custom drawer with animation. Also, use a Matrix4.translationValues.
- map

##Graphical resource
- FlatIcon [link](www.flaticon.com/)
- PNGWing [link](https://www.pngwing.com/)

##Useful info: Change launch icon
- AppIcon [link](https://appicon.co/)
- Tutorial for change the Launch Icon [link](https://www.geeksforgeeks.org/flutter-changing-app-icon/)

## Getting Started

**Packages used:**
- None

## GIF
<p align="center">
<img src="screenshots/untitled.gif" height="700">
</p>

## Screenshots
<p align="center">
<img src="screenshots\Screenshot_1652889631.png" height="700">
<img src="screenshots\Screenshot_1652889637.png" height="700">
</p>

