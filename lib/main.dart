import 'package:material_ui/material_ui.dart';

import 'models/produto.dart';
import 'models/roupa.dart';
import 'models/calcado.dart';
import 'models/acessorio.dart';


List<Produto> produtos = [
  Roupa(
    id: 1,
    nome: 'Camiseta Básica',
    preco: 59.90,
    estoque: 10,
    tamanho: 'M',
    cor: 'Preta',
    tecido: 'Algodão',
  ),

  Calcado(
    id: 2,
    nome: 'Tênis Casual',
    preco: 159.90,
    estoque: 5,
    tamanho: 38,
    tipo: 'Casual',
  ),

  Acessorio(
    id: 3,
    nome: 'Bolsa Feminina',
    preco: 89.90,
    estoque: 8,
    tipo: 'Bolsa',
    material: 'Couro',
  ),

  Roupa(
    id: 4,
    nome: 'Calça Jeans',
    preco: 119.90,
    estoque: 7,
    tamanho: '40',
    cor: 'Azul',
    tecido: 'Jeans',
  ),

  Produto(
    id: 5,
    nome: 'Boné',
    preco: 39.90,
    estoque: 12,
  ),
];
void main() {
  runApp(const MinhaLoja());
}

class MinhaLoja extends StatelessWidget {
  const MinhaLoja({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Loja de Roupas'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];

            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(produto.nome),
                subtitle: Text(
                  'Preço: R\$ ${produto.preco.toStringAsFixed(2)}\n'
                  'Estoque: ${produto.estoque} unidades',
                ),
                trailing: Text('#${produto.id}'),
              ),
            );
          },
        ),
      ),
    );
  }
}