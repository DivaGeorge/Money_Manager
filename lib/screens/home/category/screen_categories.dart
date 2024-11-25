import 'package:flutter/material.dart';
import 'package:money_manager/db/category/category_db.dart';
//import 'package:money_manager/models/category/category_model.dart';
import 'package:money_manager/screens/home/category/category_popup.dart';
import 'package:money_manager/screens/home/category/expense_list.dart';
import 'package:money_manager/screens/home/category/incom_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({super.key});

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: SafeArea(
          child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'INCOME',
              ),
              Tab(
                text: 'EXPENSE',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Income_list(),
                Expense_list(),
              ],
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("add nothing");
          ShowCategoryAddPopup(context);
          // final _sample = CategoryModel(
          //   id: DateTime.now().millisecondsSinceEpoch.toString(),
          //   name: 'Travel',
          //   type: CategoryType.expense,
          //   );
          // CategoryDB().insertCategory(_sample);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
