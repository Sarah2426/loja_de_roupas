import 'produto.dart';

class ItemPedido {
  final Produto produto;
  final int quantidade;
  final double precoUnitario;

  ItemPedido({
    required this.produto,
    required this.quantidade,
  }) : precoUnitario = produto.preco;

  double get subtotal => precoUnitario * quantidade;
}
