import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 22.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              style: TextStyle(
                fontSize: 22.0,
              ),
              decoration: InputDecoration(
                labelText: 'Valor',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(),
          ),
        ],
      ),
    );
  }
}
