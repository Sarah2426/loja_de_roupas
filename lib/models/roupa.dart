
import 'produto.dart';

class Roupa extends Produto {
  String tamanho;
  String cor;
  String tecido;

  Roupa({
    required super.id,
    required super.nome,
    required super.preco,
    required super.estoque,
    super.descricao,
    required this.tamanho,
    required this.cor,
    required this.tecido,
  });
}
