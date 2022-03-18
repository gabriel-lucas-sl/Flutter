import 'package:bytebank/components/item.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

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
