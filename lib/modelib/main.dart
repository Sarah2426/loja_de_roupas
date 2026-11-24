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
      title: 'Sistema de Loja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
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
      Roupa(
        id: 4,
        nome: 'Calça Jeans',
        preco: 149.90,
        estoque: 15,
        descricao: 'Corte reto',
        tamanho: '42',
        cor: 'Azul',
        tecido: 'Jeans',
      ),
      Calcado(
        id: 5,
        nome: 'Bota de Chuva',
        preco: 119.90,
        estoque: 12,
        tamanho: 38,
        tipo: 'Bota',
        impermeavel: true,
      ),
      Acessorio(
        id: 6,
        nome: 'Cinto de Couro',
        preco: 79.90,
        estoque: 20,
        tipo: 'Cinto',
        material: 'Couro',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Loja'),
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
              leading: Icon(_icone(produto), size: 35),
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
