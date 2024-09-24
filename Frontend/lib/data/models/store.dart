import 'dart:convert';

import 'package:flutter_with_painated_list_view/domain/entity/store.dart';

class StoreModel extends StoreEntity {
  StoreModel({
    required super.id,
    required super.name,
  });

  StoreModel copyWith({
    int? id,
    String? name,
  }) {
    return StoreModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StoreModel.fromJson(String source) =>
      StoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Store(id: $id, name: $name)';

  @override
  bool operator ==(covariant StoreModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
