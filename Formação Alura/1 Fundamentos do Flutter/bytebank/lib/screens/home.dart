import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transfer> _transfers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: _transfers.isNotEmpty
          ? TransferList(transfers: _transfers)
          : const Center(
              child: SizedBox(
                child: Text(
                  'Lista vazia...',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TransferForm();
              },
            ),
          ).then((transfer) => _updateTransfer(transfer));
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  void _updateTransfer(Transfer transfer) {
    if (transfer != null) {
      setState(() {
        _transfers.add(transfer);
      });
    }
  }
}
