import 'package:flutter/material.dart';

import 'models/acessorio.dart';
import 'models/calcado.dart';
import 'models/produto.dart';
import 'models/roupa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Moda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ListaProdutosPage(),
    );
  }
}

class ListaProdutosPage extends StatelessWidget {
  const ListaProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Produto> produtos = [
      Roupa(
        id: 1,
        nome: 'Camiseta Básica',
        preco: 59.90,
        estoque: 30,
        tamanho: 'M',
        cor: 'Preta',
        tecido: 'Algodão',
      ),
      Roupa(
        id: 2,
        nome: 'Calça Jeans',
        preco: 149.90,
        estoque: 15,
        descricao: 'Corte reto',
        tamanho: '42',
        cor: 'Azul',
        tecido: 'Jeans',
      ),
      Calcado(
        id: 3,
        nome: 'Tênis Esportivo',
        preco: 299.90,
        estoque: 8,
        tamanho: 41,
        tipo: 'Tênis',
      ),
      Calcado(
        id: 4,
        nome: 'Bota de Chuva',
        preco: 119.90,
        estoque: 12,
        tamanho: 38,
        tipo: 'Bota',
        impermeavel: true,
      ),
      Acessorio(
        id: 5,
        nome: 'Cinto de Couro',
        preco: 79.90,
        estoque: 20,
        tipo: 'Cinto',
        material: 'Couro',
      ),
      Acessorio(
        id: 6,
        nome: 'Boné Personalizado',
        preco: 49.90,
        estoque: 25,
        tipo: 'Boné',
        material: 'Poliéster',
        personalizavel: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Moda'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Icon(_icone(produto))),
              title: Text(produto.nome),
              subtitle: Text(
                '${_detalhes(produto)}\n'
                'Estoque: ${produto.estoque} unidades',
              ),
              isThreeLine: true,
              trailing: Text(
                'R\$ ${produto.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }

  IconData _icone(Produto produto) {
    if (produto is Roupa) return Icons.checkroom;
    if (produto is Calcado) return Icons.directions_walk;
    return Icons.watch;
  }

  String _detalhes(Produto produto) {
    if (produto is Roupa) {
      return 'Tamanho ${produto.tamanho} • ${produto.cor} • ${produto.tecido}';
    }
    if (produto is Calcado) {
      final chuva = produto.adequadoParaChuva()
          ? 'serve para chuva'
          : 'não serve para chuva';
      return 'Nº ${produto.tamanho} • ${produto.tipo} • $chuva';
    }
    if (produto is Acessorio) {
      final pers = produto.podePersonalizar()
          ? 'personalizável'
          : 'não personalizável';
      return '${produto.tipo} • ${produto.material} • $pers';
    }
    return produto.descricao ?? '';
  }
}
