
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:verenaadm/Screens/Home/caragar_produto.dart';
import 'package:verenaadm/Screens/Home/categorias_page.dart';
import 'package:verenaadm/Screens/Home/pedidos_page.dart';
//import 'package:verenaadm/Screens/Home/ventas_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('VerenaADM'),
      ),
      body: Center(
        child: Column(
          children: [
         
            const Spacer(),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                child: const Text('Adicionar Produto'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CargarProduto(),
                    ),
                  );
                },
               
              ),
            ),
             const Spacer(),
       
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                child: const Text('Lista de Produtos'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Categorias(),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                child: const Text('Pedidos'),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Pedidos(),
                    ),
                  );
                },
               
              ),
            ),
             const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                child: const Text('SingOut'),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
