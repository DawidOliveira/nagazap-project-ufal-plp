import 'dart:convert';

class User {
  final String id;
  final String name;
  final String? socketId;
  User({
    required this.id,
    required this.name,
    this.socketId,
  });

  User copyWith({
    String? id,
    String? name,
    String? socketId,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      socketId: socketId ?? this.socketId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'socketId': socketId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      socketId: map['socketId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(id: $id, name: $name, socketId: $socketId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.socketId == socketId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ socketId.hashCode;
}
