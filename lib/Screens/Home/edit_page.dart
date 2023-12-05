import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditPage extends StatefulWidget {
  const EditPage(
      {super.key,
      required this.price,
      required this.produto,
      required this.collection,
      required this.reference,
      required this.stock});

  final String price, produto, collection, reference, stock;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  @override
  void initState() {
    priceController.text = widget.price;
    stockController.text = widget.stock;
    super.initState();
  }

  @override
  void dispose() {
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Spacer(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CentavosInputFormatter()
                  ],

                  controller: priceController,
                  cursorColor: Colors.amberAccent,
                  // style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Preco',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 2),
                      child: Icon(
                        Icons.attach_money_outlined,
                        size: 35,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.amberAccent),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Preco';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: stockController,
                  cursorColor: Colors.amberAccent,
                  // style: const TextStyle(fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Quantidade',
                    labelStyle: TextStyle(color: Colors.black,backgroundColor: Colors.orange),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 2),
                      child: Icon(
                        Icons.fact_check_outlined,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.amberAccent),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Quantidade';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _db
                          .collection(widget.collection)
                          .doc(widget.reference)
                          .update({
                        // 'description': descripcion.text,

                        // 'reference': reference.text,
                           'stock': int.parse(stockController.text),
                        'preco': double.parse(
                            priceController.text.replaceAll(',', '.')),
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text("Modificar"),
                ),
                const Spacer(),
              ],
            )),
      ),
    );
  }
}
