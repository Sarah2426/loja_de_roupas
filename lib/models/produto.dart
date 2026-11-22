
class Produto {
  final int id;
  String nome;
  double preco;
  int _estoque;
  String? descricao;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required int estoque,
    this.descricao,
  }) : _estoque = estoque;

  
  int get estoque => _estoque;

  
  bool retirarEstoque(int quantidade) {
    if (quantidade <= 0 || quantidade > _estoque) {
      return false;
    }

    _estoque -= quantidade;
    return true;
  }
}
