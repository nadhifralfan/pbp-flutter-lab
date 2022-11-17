import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/components/drawer_component.dart';
import 'package:counter_7/main.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BudgetForm extends StatefulWidget {
  const BudgetForm({super.key});

  final String title = "Form Budget";

  @override
  State<BudgetForm> createState() => _BudgetFormState();
}

class _BudgetFormState extends State<BudgetForm> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _amount = 0;
  String _type = 'Pilih Jenis';
  List<String> types = ['Pilih Jenis', 'Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerComponents(currentPage: "Tambah Budget"),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Makanan",
                          labelText: "Judul",
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _title = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Judul tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              hintText: "20000",
                              labelText: "Nominal",
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _amount = value == null
                                    ? 0
                                    : value.isNotEmpty
                                        ? int.parse(value)
                                        : 0;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButtonFormField(
                              hint: const Text("Pilih Jenis"),
                              value: _type,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: types.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _type = value ?? "";
                                });
                              },
                              validator: (String? value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "Pilih Jenis") {
                                  return 'Jenis tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: dateInput,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today_rounded),
                              labelText: "Masukkan Tanggal"),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                dateInput.text =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                              });
                            }
                          },
                        ))
                  ],
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var budget = {
                        "judul": _title,
                        "nominal": _amount,
                        "jenis": _type,
                        "tanggal": dateInput.text
                      };

                      Provider.of<BudgetModel>(context, listen: false)
                          .addBudget(budget);

                      _formKey.currentState?.reset();

                      setState(() {
                        _type = 'Pilih Jenis';
                        dateInput.text = "";
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Data has been saved!")));
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
