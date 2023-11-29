import 'package:flutter/material.dart';
import 'package:verenaadm/Screens/Home/list_produc.dart';

class Categorias extends StatefulWidget {
  const Categorias({super.key});

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Categorias'),
      ),
      body: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'PizzasT',
                      titulo: 'Pizzas Tradicionas',
                    ),
                  ),
                );
              },
              child: const Text('Pizzas Tradicionas'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'PizzasD',
                      titulo: 'Pizzas Doces',
                    ),
                  ),
                );
              },
              child: const Text('Pizzas Doces'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'Massas',
                      titulo: 'Massas',
                    ),
                  ),
                );
              },
              child: const Text('Massas'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'Saladas',
                      titulo: 'Saladas',
                    ),
                  ),
                );
              },
              child: const Text('Saladas'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'Bebidas',
                      titulo: 'Bebidas',
                    ),
                  ),
                );
              },
              child: const Text('Bebidas'),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ListProduct(
                      collection: 'Petiscos',
                      titulo: 'Petiscos',
                    ),
                  ),
                );
              },
              child: const Text('Petiscos'),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
