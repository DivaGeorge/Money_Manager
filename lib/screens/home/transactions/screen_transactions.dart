import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/transactions/transaction_db.dart';
import 'package:money_manager/db/transactions/transcation_model.dart';
import 'package:money_manager/models/category/category_model.dart';
import 'package:money_manager/screens/home/transactions/add_transcations/screen_add_transaction.dart'; // Corrected the directory name.

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refresh();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: TransactionDB.instance.transactionListNotifier,
          builder:
              (BuildContext ctx, List<TransactionsModel> newList, Widget? _) {
            return ListView.separated(
              padding: const EdgeInsets.all(10),
              itemBuilder: (ctx, index) {
                final _value = newList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    key: Key(_value.id!),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (ctx) {
                            TransactionDB.instance
                                .deleteTransaction(_value.id!);
                          },
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          child: Text(
                            parseDate(_value.date),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: _value.type == CategoryType.income
                              ? Colors.green
                              : Colors.red,
                        ),
                        title: Text('₹ ${_value.amount}'),
                        subtitle: Text(_value.category.name),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => const SizedBox(
                height: 10,
              ),
              itemCount: newList.length,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Add transaction");
          Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String parseDate(DateTime date) {
    final _date = DateFormat.MMMd().format(date);
    final _splitedDate = _date.split('');
    return '${_splitedDate.last}\n${_splitedDate.first}';
  }
}
