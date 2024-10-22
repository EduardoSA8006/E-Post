class User {
  final int? id;
  final String name;
  final String email;
  final String senha;
  final Date dataNascimento;
  final DateTime? dataCriacao;  // Pode ser nulo ao criar um novo usuário
  final String? telefone;
  final String? fotoPerfil;
  final String? bio;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.senha,
    required this.dataNascimento,
    this.dataCriacao,  // Geralmente preenchido automaticamente pelo banco de dados
    this.telefone,
    this.fotoPerfil,
    this.bio,
  });

  // Converte um Map (do banco de dados) para um objeto User
  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        senha: json['senha'],
        dataNascimento: DateTime.parse(json['data_nascimento']),
        dataCriacao: json['data_criacao'] != null ? DateTime.parse(json['data_criacao']) : null,
        telefone: json['telefone'],
        fotoPerfil: json['foto_perfil'],
        bio: json['bio'],
      );

  // Converte um objeto User para um Map (para inserção no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'senha': senha,
      'data_nascimento': dataNascimento.toIso8601String(),
      'data_criacao': dataCriacao?.toIso8601String(),
      'telefone': telefone,
      'foto_perfil': fotoPerfil,
      'bio': bio,
    };
  }
}
