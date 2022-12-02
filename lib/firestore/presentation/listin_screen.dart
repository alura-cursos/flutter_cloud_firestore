import 'package:flutter/material.dart';

import '../models/listin.dart';
import '../models/produto.dart';
import 'widgets/list_tile_produto.dart';

class ListinScreen extends StatefulWidget {
  final Listin listin;
  const ListinScreen({super.key, required this.listin});

  @override
  State<ListinScreen> createState() => _ListinScreenState();
}

class _ListinScreenState extends State<ListinScreen> {
  List<Produto> listaProdutosPlanejados = [
    Produto(id: "ADASD", name: "Maçã", isComprado: false),
    Produto(id: "UUID", name: "Pêra", isComprado: false),
  ];

  List<Produto> listaProdutosPegos = [
    Produto(id: "UUID", name: "Laranja", amount: 5, price: 1, isComprado: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.listin.name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: const [
                Text(
                  "R\$${0}",
                  style: TextStyle(fontSize: 42),
                ),
                Text(
                  "total previsto para essa compra",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(thickness: 2),
          ),
          const Text(
            "Produtos Planejados",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: List.generate(listaProdutosPlanejados.length, (index) {
              Produto produto = listaProdutosPlanejados[index];
              return ListTileProduto(
                produto: produto,
                isComprado: false,
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(thickness: 2),
          ),
          const Text(
            "Produtos no Carrinho",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
            children: List.generate(listaProdutosPegos.length, (index) {
              Produto produto = listaProdutosPegos[index];
              return ListTileProduto(
                produto: produto,
                isComprado: true,
              );
            }),
          ),
        ],
      ),
    );
  }
}
