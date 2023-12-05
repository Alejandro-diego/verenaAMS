import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:verenaadm/Screens/Home/edit_page.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({
    super.key,
    required this.collection,
    required this.titulo,
  });

  final String collection;
  final String titulo;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  late bool find = false;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Lista de Produto',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() {}),
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.titulo,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 400,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(widget.collection)                 
                  .orderBy('produto', descending: find)
                  .startAt([_searchController.text.toUpperCase()]).endAt([
                '${_searchController.text.toUpperCase()}\uf8ff'
              ]).snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Carregando");
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: ListTile(
                          isThreeLine: true,
                          title: Text(data['produto']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reference n° :${data['reference']}'),
                              Text('Estoque    :${data['stock']}'),
                            ],
                          ),
                          trailing: Text('R\$: ${data['preco']}'),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditPage(
                                  collection: widget.collection,
                                  produto: data['produto'],
                                  price: '${data['preco']}',
                                  reference: '${data['reference']}',
                                  stock: '${data['stock']}',
                                ),
                              ),
                            );
                          },
                          onLongPress: () {
                            _db
                                .collection('produtos')
                                .doc(data['produto'].toString())
                                .delete();
                            debugPrint(data['produto'].toString());
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
