import 'package:flutter/material.dart';
import 'package:counter_7/screens/counter_7.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ScreenState>(create: (_) => ScreenState()),
        ChangeNotifierProvider<BudgetModel>(create: (_) => BudgetModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Counter7(),
      ),
    );
  }
}

class ScreenState with ChangeNotifier {
  int _currentScreen = 0;
  int get getCurrentScreen => _currentScreen;

  void setCurrentScreen(int screenIndex) {
    _currentScreen = screenIndex;
    notifyListeners();
  }
}

class BudgetModel with ChangeNotifier {
  final List<dynamic> _budgets = [];
  List<dynamic> get getBudgets => _budgets;

  void addBudget(Map budget) {
    _budgets.add(budget);
    notifyListeners();
  }
}
