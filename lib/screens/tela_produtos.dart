import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../models/roupa.dart';
import '../models/calcado.dart';
import '../models/acessorio.dart';

class TelaProdutos extends StatelessWidget {
  TelaProdutos({super.key});

  final List<Produto> produtos = [
    Roupa(
      id: 1,
      nome: 'Camiseta',
      preco: 49.90,
      estoque: 10,
      tamanho: 'M',
      cor: 'Preto',
      tecido: 'Algodão',
    ),
    Calcado(
      id: 2,
      nome: 'Tênis',
      preco: 150.00,
      estoque: 8,
      tamanho: 38,
      tipo: 'Esportivo',
      impermeavel: true,
    ),
    Acessorio(
      id: 3,
      nome: 'Colar',
      preco: 35.00,
      estoque: 12,
      tipo: 'Bijuteria',
      material: 'Aço',
      personalizavel: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Loja'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,

        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                size: 35,
              ),

              title: Text(produto.nome),

              subtitle: Text(
                'Preço: R\$ ${produto.preco.toStringAsFixed(2)}\n'
                'Estoque: ${produto.estoque}',
              ),

              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}

