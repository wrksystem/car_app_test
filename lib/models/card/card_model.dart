class CarModel {
  final int id;
  final int timestamp_cadastro;
  final int modelo_id;
  final int ano;
  final String combustivel;
  final int num_portas;
  final String cor;
  final String nome_modelo;
  final double valor;

  CarModel({
    required this.id,
    required this.timestamp_cadastro,
    required this.modelo_id,
    required this.ano,
    required this.combustivel,
    required this.num_portas,
    required this.cor,
    required this.nome_modelo,
    required this.valor,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      timestamp_cadastro: json['timestamp_cadastro'],
      modelo_id: json['modelo_id'],
      ano: json['ano'],
      combustivel: json['combustivel'],
      num_portas: json['num_portas'],
      cor: json['cor'],
      nome_modelo: json['nome_modelo'],
      valor: json['valor'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp_cadastro': timestamp_cadastro,
      'modelo_id': modelo_id,
      'ano': ano,
      'combustivel': combustivel,
      'num_portas': num_portas,
      'cor': cor,
      'nome_modelo': nome_modelo,
      'valor': valor.toStringAsFixed(3).replaceAll('.', ','),
    };
  }




  CarModel copyWith({
    int? id,
    int? timestamp_cadastro,
    int? modelo_id,
    int? ano,
    String? combustivel,
    int? num_portas,
    String? cor,
    String? nome_modelo,
    double? valor,
  }) {
    return CarModel(
      id: id ?? this.id,
      timestamp_cadastro: timestamp_cadastro ?? this.timestamp_cadastro,
      modelo_id: modelo_id ?? this.modelo_id,
      ano: ano ?? this.ano,
      combustivel: combustivel ?? this.combustivel,
      num_portas: num_portas ?? this.num_portas,
      cor: cor ?? this.cor,
      nome_modelo: nome_modelo ?? this.nome_modelo,
      valor: valor ?? this.valor,
    );
  }
}
