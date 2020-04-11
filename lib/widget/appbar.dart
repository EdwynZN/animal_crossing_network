import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  final Widget title;
  final List<Widget> actions;
  final Widget bottom;

  const CustomAppBar({
    this.title,
    this.actions,
    this.bottom
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: CustomACShape(),
      pinned: true, primary: true,
      centerTitle: true,
      title: title,
      actions: actions,
      bottom: bottom,
      /*<Widget>[
        const Icon(Icons.search),
        const SizedBox(width: 20,),
        const Icon(Icons.remove_red_eye),
        const SizedBox(width: 20,)
      ],*/
    );
  }
}

class CustomAppBarShape extends ContinuousRectangleBorder{

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return Path()..moveTo(0, 0)..lineTo(0, rect.height)
      ..quadraticBezierTo(rect.width / 2, rect.height + 20, rect.width, rect.height)
      ..lineTo(rect.width, 0)..close();
  }
}

class CustomACShape extends RoundedRectangleBorder{

  @override
  Path getOuterPath(Rect rect, { TextDirection textDirection }) {
    return Path()..lineTo(0, rect.height)
      ..quadraticBezierTo(rect.width / 4, rect.height + 15, rect.width / 3, rect.height)
      ..quadraticBezierTo(rect.width / 2, rect.height + 30, rect.width * 0.66, rect.height)
      ..quadraticBezierTo(rect.width * 0.75, rect.height + 15, rect.width, rect.height)
      ..lineTo(rect.width, 0)..close();
  }
}
