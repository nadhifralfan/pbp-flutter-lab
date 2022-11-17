import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/screens/form_budget.dart';
import 'package:counter_7/screens/data_budget.dart';
import 'package:counter_7/screens/counter_7.dart';
import 'package:provider/provider.dart';

class DrawerComponents extends StatelessWidget {
  const DrawerComponents({super.key, required this.currentPage});

  final String currentPage;

  @override
  Widget build(BuildContext context) {
    var currentScreen = Provider.of<ScreenState>(context).getCurrentScreen;

    return Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Counter 7",
            style: currentScreen == 0
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Counter 7") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(0);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Counter7()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Tambah Budget",
            style: currentScreen == 1
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Tambah Budget") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(1);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BudgetForm()));
            }
          },
        ),
        ListTile(
          title: Text(
            "Data Budget",
            style: currentScreen == 2
                ? const TextStyle(fontWeight: FontWeight.bold)
                : const TextStyle(fontWeight: FontWeight.normal),
          ),
          onTap: () {
            Navigator.of(context).pop();
            if (currentPage != "Data Budget") {
              Provider.of<ScreenState>(context, listen: false)
                  .setCurrentScreen(2);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const BudgetData()));
            }
          },
        )
      ],
    ));
  }
}
