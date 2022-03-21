import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/card_app.dart';

class PageViewApp extends StatelessWidget {
  final double? top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool toogleMenu;

  const PageViewApp(
      {Key? key,
      required this.top,
      required this.onChanged,
      required this.onPanUpdate,
      required this.toogleMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          physics: toogleMenu
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          children: const [
            CardApp(),
            CardApp(),
            CardApp(),
          ],
        ),
      ),
    );
  }
}
