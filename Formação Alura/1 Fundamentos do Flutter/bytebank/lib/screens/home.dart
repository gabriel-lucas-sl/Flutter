import 'package:bytebank/screens/transfer_form.dart';
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
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
          future.then((transfer) => {
                if (transfer != null)
                  {
                    setState(() {
                      _transfers.add(transfer);
                    })
                  }
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  final List<Transfer> transfers;
  const TransferList({Key? key, required this.transfers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transfers.length,
      itemBuilder: (context, index) {
        return TransferItem(transfer: transfers[index]);
      },
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
        subtitle: Text(transfer.accountNumber.toString()),
      ),
    );
  }
}

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
