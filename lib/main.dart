import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/db/category/category_db.dart';
import 'package:money_manager/db/transactions/transcation_model.dart';
import 'package:money_manager/models/category/category_model.dart';
import 'package:money_manager/screens/home/screen_home.dart';
import 'package:money_manager/screens/home/transactions/add_transcations/screen_add_transaction.dart';

void main() async {
  // final obj1 = CategoryDB();
  // final obj2 = CategoryDB();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }

   if (!Hive.isAdapterRegistered(TransactionsModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionsModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      routes: {
        ScreenAddTransaction.routeName:(ctx)=>const ScreenAddTransaction(),
      },
    );
  }
}
