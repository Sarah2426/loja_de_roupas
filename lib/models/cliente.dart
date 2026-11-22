class Cliente {
  final int id;
  String nome;
  String email;
  String? telefone;

  Cliente({
    required this.id,
    required this.nome,
    required this.email,
    this.telefone,
  });
}