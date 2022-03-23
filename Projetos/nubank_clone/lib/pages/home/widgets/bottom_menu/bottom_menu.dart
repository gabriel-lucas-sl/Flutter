import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/bottom_menu/item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  const BottomMenu({Key? key, required this.showMenu}) : super(key: key);

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
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
            duration: const Duration(milliseconds: 200),
            bottom:
                !widget.showMenu ? MediaQuery.of(context).padding.bottom : 0,
            left: value,
            right: value * -1,
            height: MediaQuery.of(context).size.height * .13,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IgnorePointer(
                ignoring: widget.showMenu,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: !widget.showMenu ? 1 : 0,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      ItemMenuBottom(
                        icon: Icons.person_add,
                        text: 'Indicar amigos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.phone_android,
                        text: 'Recarga de celular',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chat,
                        text: 'Cobrar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.monetization_on,
                        text: 'Empréstimos',
                      ),
                      ItemMenuBottom(
                        icon: Icons.move_to_inbox,
                        text: 'Depositar',
                      ),
                      ItemMenuBottom(
                        icon: Icons.mobile_screen_share,
                        text: 'Transferir',
                      ),
                      ItemMenuBottom(
                        icon: Icons.format_align_center,
                        text: 'Ajustar limite',
                      ),
                      ItemMenuBottom(
                        icon: Icons.chrome_reader_mode,
                        text: 'Pagar',
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: ItemMenuBottom(
                          icon: Icons.lock_open,
                          text: 'Bloquear cartão',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
