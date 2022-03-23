import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu_rounded,
            color: Colors.white,
            size: 30,
          ),
          Container(
            width: 55,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(.1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.hourglass_top_rounded,
                    size: 15,
                    color: Colors.white,
                  ),
                  Container(
                    width: 1.5,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/fire.svg',
                    color: Colors.white,
                    width: 15,
                    semanticsLabel: 'fire',
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              // Icon(
              //   Icons.currency_exchange,
              //   color: Colors.orange[300],
              //   size: 20,
              // ),
              Container(
                height: 18,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 8.8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
