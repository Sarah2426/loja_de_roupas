import 'models/cliente.dart';
import 'models/produto.dart';
import 'models/roupa.dart';
import 'models/calcado.dart';
import 'models/acessorio.dart';

void main() {
  Cliente cliente = Cliente(
    id: 1,
    nome: 'Julia',
    email: 'julia@email.com',
    telefone: '22999999999',
  );

  Produto produto = Produto(
    id: 1,
    nome: 'Camiseta',
    preco: 49.90,
    estoque: 10,
  );

  Roupa roupa = Roupa(
    id: 2,
    nome: 'Blusa',
    preco: 79.90,
    estoque: 5,
    tamanho: 'M',
    cor: 'Preto',
    tecido: 'Algodão',
  );

  Calcado calcado = Calcado(
    id: 3,
    nome: 'Tênis',
    preco: 150.00,
    estoque: 8,
    tamanho: 38,
    tipo: 'Esportivo',
    impermeavel: true,
  );
