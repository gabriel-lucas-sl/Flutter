import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SecondCard extends StatefulWidget {
  const SecondCard({Key? key}) : super(key: key);

  @override
  State<SecondCard> createState() => _SecondCardState();
}

class _SecondCardState extends State<SecondCard>
    with AutomaticKeepAliveClientMixin {
  bool _showAmount = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.attach_money,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Conta',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _showAmount = !_showAmount;
                          });
                        },
                        child: SvgPicture.asset(
                          _showAmount
                              ? 'assets/icons/eye-outline.svg'
                              : 'assets/icons/eye-off-outline.svg',
                          color: Colors.grey,
                          semanticsLabel: 'disable_eye',
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SALDO DISPONÍVEL',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.5,
                          ),
                        ),
                        _showAmount
                            ? const Text.rich(
                                TextSpan(
                                  text: 'R\$ 176.395,62',
                                ),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                ),
                              )
                            : Container(
                                height: 32.5,
                                width: 200,
                                color: Colors.grey[300],
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * .05),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.credit_card,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 10),
                      const Flexible(
                        child: Text(
                          'Compra mais recente no Super Mercado no valor de R\$ 886,45 sexta',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey[400],
                        size: 20,
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
