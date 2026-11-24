import 'cliente.dart';
import 'produto.dart';
import 'item_pedido.dart';

class Pedido {
  final int id;
  final Cliente cliente;

  List<ItemPedido> _itens = [];
  bool _finalizado = false;

  Pedido({
    required this.id,
    required this.cliente,
  });

  List<ItemPedido> get itens => List.unmodifiable(_itens);

  bool get finalizado => _finalizado;

  double get valorTotal {
    double total = 0;

    for (var item in _itens) {
      total += item.subtotal;
    }

    return total;
  }

  bool adicionarItem(Produto produto, int quantidade) {
    if (_finalizado || quantidade <= 0) {
      return false;
    }

    if (!produto.retirarEstoque(quantidade)) {
      return false;
    }

    _itens.add(
      ItemPedido(
        produto: produto,
        quantidade: quantidade,
      ),
    );

    return true;
  }

  bool finalizarPedido() {
    if (_finalizado || _itens.isEmpty) {
      return false;
    }

    _finalizado = true;
    return true;
  }
}
