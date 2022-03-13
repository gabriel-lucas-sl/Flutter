import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/my_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _showMenu;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        MyAppBar(
          showMenu: _showMenu,
          onTap: () {
            setState(() {
              _showMenu = !_showMenu;
            });
          },
        ),
      ]),
    );
  }
}
