import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _accountFieldController = TextEditingController();
  final TextEditingController _valueFieldController = TextEditingController();
  TransferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Editor(
            controller: _accountFieldController,
            label: 'Número da conta',
            hint: '0000',
            icon: Icons.person,
          ),
          Editor(
            controller: _valueFieldController,
            label: 'Valor',
            hint: '0.00',
            icon: Icons.monetization_on,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? account = int.tryParse(_accountFieldController.text);
    final double? value = double.tryParse(_valueFieldController.text);

    if (account != null && value != null) {
      final createdTransfer = Transfer(value, account);
      Navigator.pop(context, createdTransfer);
    }
  }
}
