import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'Nenhuma transação cadastrada',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        :
        // trabalhando com statefull + GlobalObjectKey + o builder do listView com uso de chaves
        ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return TransactionItem(
                key: GlobalObjectKey(tr),
                tr: tr,
                onRemove: onRemove,
              );
            },
          );
    // trabalhando com statefull + ValueKey com uso de chaves
    // ListView(
    //     children: transactions.map((e) {
    //       return TransactionItem(
    //         key: ValueKey(e.id),
    //         tr: e,
    //         onRemove: onRemove,
    //       );
    //     }).toList(),
    //   );
    // trabalhando com stateless
    // ListView.builder(
    //     itemCount: transactions.length,
    //     itemBuilder: (ctx, index) {
    //       final tr = transactions[index];
    //       return TransactionItem(
    //         tr: tr,
    //         onRemove: onRemove,
    //       );
    //     },
    //   );
  }
}
