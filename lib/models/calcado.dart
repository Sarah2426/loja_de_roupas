import 'produto.dart';

class Calcado extends Produto {
  int tamanho;
  String tipo;
  bool _impermeavel;

  Calcado({
    required super.id,
    required super.nome,
    required super.preco,
    required super.estoque,
    super.descricao,
    required this.tamanho,
    required this.tipo,
    bool impermeavel = false,
  }) : _impermeavel = impermeavel;

  bool get impermeavel => _impermeavel;

  bool adequadoParaChuva() {
    return _impermeavel;
  }
} 
