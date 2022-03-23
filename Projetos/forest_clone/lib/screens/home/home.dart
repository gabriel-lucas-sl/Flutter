import 'package:flutter/material.dart';
import 'package:forest_clone/components/header.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#50a387'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              const Header(),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
