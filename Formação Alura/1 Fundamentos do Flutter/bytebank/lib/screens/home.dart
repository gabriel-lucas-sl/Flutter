import 'package:bytebank/screens/transfer_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: const TransferForm(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransferItem(transfer: Transfer(100.0, 1000)),
        TransferItem(transfer: Transfer(400.0, 1004)),
        TransferItem(transfer: Transfer(300.0, 1041)),
      ],
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer transfer;

  const TransferItem({Key? key, required this.transfer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transfer.value.toString()),
        subtitle: Text(transfer.accountNmber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNmber;

  Transfer(this.value, this.accountNmber);
}
