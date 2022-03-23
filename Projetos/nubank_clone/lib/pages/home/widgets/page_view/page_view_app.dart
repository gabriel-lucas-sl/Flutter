import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/bottom_menu/card_app.dart';
import 'package:nubank_clone/pages/home/widgets/cards/first_card.dart';
import 'package:nubank_clone/pages/home/widgets/cards/second_card.dart';
import 'package:nubank_clone/pages/home/widgets/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
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
  State<PageViewApp> createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  late Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            top: widget.top,
            height: MediaQuery.of(context).size.height * .45,
            left: value,
            right: value * -1,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              child: PageView(
                onPageChanged: widget.onChanged,
                physics: widget.toogleMenu
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                children: const [
                  CardApp(
                    child: FirstCard(),
                  ),
                  CardApp(
                    child: SecondCard(),
                  ),
                  CardApp(
                    child: ThirdCard(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
