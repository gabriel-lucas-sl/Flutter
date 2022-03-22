import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home/widgets/item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool toogleMenu;

  final _qrCode =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/2048px-QR_code_for_mobile_English_Wikipedia.svg.png';

  const MenuApp({Key? key, required this.top, required this.toogleMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: toogleMenu ? 1 : 0,
        child: Container(
          // decoration: BoxDecoration,
          color: Colors.purple[800],
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            children: <Widget>[
              Image.network(
                _qrCode,
                height: 120,
                color: Colors.white,
              ),
              const Text.rich(
                TextSpan(text: 'Banco', children: [
                  TextSpan(
                    text: '260 - Nu Pagamentos S.A',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text.rich(
                TextSpan(text: 'Agência', children: [
                  TextSpan(
                    text: '0001',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text.rich(
                TextSpan(text: 'Conta ', children: [
                  TextSpan(
                    text: '000300-0',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      const ItemMenu(
                        icon: Icons.info_outline,
                        text: 'Me ajuda',
                      ),
                      const ItemMenu(
                        icon: Icons.person_outline,
                        text: 'Perfil',
                      ),
                      const ItemMenu(
                        icon: Icons.settings_outlined,
                        text: 'Configurar conta',
                      ),
                      const ItemMenu(
                        icon: Icons.credit_card,
                        text: 'Configurar cartão',
                      ),
                      const ItemMenu(
                        icon: Icons.store_mall_directory,
                        text: 'Pedir conta PJ',
                      ),
                      const ItemMenu(
                        icon: Icons.phone_android,
                        text: 'Configurações do app',
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.7, color: Colors.white54)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple[800],
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'SAIR DO APP',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
