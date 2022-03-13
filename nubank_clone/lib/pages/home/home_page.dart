import 'package:flutter/material.dart';
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

    if (_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }

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
      ]),
    );
  }
}
