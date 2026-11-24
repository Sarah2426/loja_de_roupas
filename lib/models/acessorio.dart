import 'produto.dart';

class Acessorio extends Produto {
  String tipo;
  String material;
  bool _personalizavel;

  Acessorio({
    required super.id,
    required super.nome,
    required super.preco,
    required super.estoque,
    super.descricao,
    required this.tipo,
    required this.material,
    bool personalizavel = false,
  }) : _personalizavel = personalizavel;

  bool get personalizavel => _personalizavel;

  bool podePersonalizar() {
    return _personalizavel;
  }
}
