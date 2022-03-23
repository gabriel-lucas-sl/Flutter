import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdCard extends StatefulWidget {
  const ThirdCard({Key? key}) : super(key: key);

  @override
  State<ThirdCard> createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {
  final bool _buttomPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/gift-outline.svg',
            color: Colors.grey,
            semanticsLabel: 'gift',
          ),
          const Text(
            'Nubank Rewards',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          Text(
            'Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente usa.',
            style: TextStyle(color: Colors.grey[800], fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: .7, color: const Color(0xFF4A148C)),
              borderRadius: BorderRadius.circular(3),
            ),
            child: ElevatedButton(
              child: const Text(
                'ATIVE O SEU REWARDS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                elevation: MaterialStateProperty.all(0.0),
                foregroundColor: _buttomPressed
                    ? MaterialStateProperty.all(Colors.white)
                    : MaterialStateProperty.all(Colors.purple[800]),
                overlayColor: MaterialStateProperty.all(Colors.purple[800]),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
