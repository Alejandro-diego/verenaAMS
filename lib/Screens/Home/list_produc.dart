import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({
    super.key,
  });

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
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Lista de Produto',
            suffixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => setState(() {}),
        ),
      ),
     
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('produtos')
            // .where('produc' ,arrayContainsAny: ['CERA'])
            .orderBy('description', descending: find)
            .startAt([_searchController.text.toUpperCase()]).endAt(
                ['${_searchController.text.toUpperCase()}\uf8ff']).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Carregando");
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(data['description']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Produto n° :${data['produto']}'),
                        Text('BarCode n° :${data['barCode']}'),
                        Text('Estoque    :${data['stock']}'),
                      ],
                    ),
                    trailing: Text('R\$: ${data['preco']}'),
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
    );
  }
  



}
