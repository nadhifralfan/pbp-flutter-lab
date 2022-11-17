import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:provider/provider.dart';
import 'package:counter_7/components/drawer_component.dart';

class BudgetData extends StatelessWidget {
  const BudgetData({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> budgets = Provider.of<BudgetModel>(context).getBudgets;

    return Scaffold(
        appBar: AppBar(title: const Text("Data Budget")),
        drawer: const DrawerComponents(currentPage: "Data Budget"),
        body: ListView(
            padding: const EdgeInsets.all(12),
            children: budgets
                .map((budget) => SizedBox(
                    height: 88,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              ]),
                          child: Column(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 64),
                                        child: Text(budget['judul'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                      Text(budget['tanggal']),
                                    ],
                                  )),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(budget['nominal'].toString()),
                                      Text(
                                        budget['jenis'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                budget['jenis'] == "Pemasukan"
                                                    ? Colors.green
                                                    : Colors.red),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ))))
                .toList()));
  }
}
