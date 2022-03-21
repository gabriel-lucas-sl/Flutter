import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/item_menu_bottom.dart';
import 'package:nubank_clone/pages/home/widgets/menu_app.dart';
import 'package:nubank_clone/pages/home/widgets/my_app_bar.dart';
import 'package:nubank_clone/pages/home/widgets/my_dots_app.dart';
import 'package:nubank_clone/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;
  late int _currentIndex;
  double? _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    _yPosition ??= _screenHeight * .24;

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        MyAppBar(
          showMenu: _showMenu,
          onTap: () {
            setState(() {
              _showMenu = !_showMenu;
              _yPosition =
                  _showMenu ? _screenHeight * .75 : _screenHeight * .24;
            });
          },
        ),
        MenuApp(
          top: _screenHeight * .20,
          toogleMenu: _showMenu,
        ),
        PageViewApp(
          // !_showMenu ? _screenHeight * .24 : _screenHeight * .75,
          top: _yPosition,
          toogleMenu: _showMenu,
          onChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          onPanUpdate: (details) {
            double topPositionLimit = _screenHeight * .24;
            double bottomPositionLimit = _screenHeight * 75;
            double middlePosition =
                (bottomPositionLimit - topPositionLimit) / 2;

            setState(() {
              if (_yPosition != null) {
                _yPosition = _yPosition! + details.delta.dy;

                _yPosition = _yPosition! < topPositionLimit
                    ? topPositionLimit
                    : _yPosition;

                _yPosition = _yPosition! > bottomPositionLimit
                    ? bottomPositionLimit
                    : _yPosition;

                if (_yPosition != bottomPositionLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition! > topPositionLimit + middlePosition - 50
                          ? bottomPositionLimit
                          : _yPosition;
                }

                if (_yPosition != bottomPositionLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition! < topPositionLimit - middlePosition
                      ? topPositionLimit
                      : _yPosition;
                }

                if (_yPosition == bottomPositionLimit) {
                  _showMenu = true;
                } else if (_yPosition == topPositionLimit) {
                  _showMenu = false;
                }
              }
            });
          },
        ),
        MyDotsApp(
          top: _screenHeight * .70,
          currentIndex: _currentIndex,
          toogleMenu: _showMenu,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          bottom: !_showMenu ? MediaQuery.of(context).padding.bottom : 0,
          left: 0,
          right: 0,
          height: _screenHeight * .12,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: !_showMenu ? 1 : 0,
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
        )
      ]),
    );
  }
}
