class Cliente {
  final int id;
  String nome;
  String email;
  String? telefone;

  bool _ativo;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    this.telefone,
    bool ativo = true,
  }) : _ativo = ativo;

  bool get ativo => _ativo;

  bool desativarCadastro() {
    if (!_ativo) {
      return false;
    }

    _ativo = false;
    return true;
  }

  bool podeRealizarCompra() {
    return _ativo;
  }
}
