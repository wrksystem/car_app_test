class CarModel {
  final int id;
  final int timestampRegistration;
  final int modelId;
  final int year;
  final String fuel;
  final int numDoors;
  final String color;
  final String nameModel;
  final double value;
  final String? image;

  CarModel({
    required this.id,
    required this.timestampRegistration,
    required this.modelId,
    required this.year,
    required this.fuel,
    required this.numDoors,
    required this.color,
    required this.nameModel,
    required this.value,
    this.image,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      timestampRegistration: json['timestamp_cadastro'],
      modelId: json['modelo_id'],
      year: json['ano'],
      fuel: json['combustivel'],
      numDoors: json['num_portas'],
      color: json['cor'],
      nameModel: json['nome_modelo'],
      value: json['valor'].toDouble(),
    );
  }

  CarModel copyWith({
    int? id,
    int? timestampRegistration,
    int? modelId,
    int? year,
    String? fuel,
    int? numDoors,
    String? color,
    String? nameModel,
    double? value,
    String? image,
  }) {
    return CarModel(
      id: id ?? this.id,
      timestampRegistration: timestampRegistration ?? this.timestampRegistration,
      modelId: modelId ?? this.modelId,
      year: year ?? this.year,
      fuel: fuel ?? this.fuel,
      numDoors: numDoors ?? this.numDoors,
      color: color ?? this.color,
      nameModel: nameModel ?? this.nameModel,
      value: value ?? this.value,
      image: image ?? this.image,
    );
  }
}
