import 'dart:convert';

class Message {
  final String id;
  final String text;
  final String room;
  final String senderId;
  final String receiverId;
  final DateTime date;
  Message({
    required this.id,
    required this.text,
    required this.room,
    required this.senderId,
    required this.receiverId,
    required this.date,
  });

  Message copyWith({
    String? id,
    String? text,
    String? room,
    String? senderId,
    String? receiverId,
    DateTime? date,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      room: room ?? this.room,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'room': room,
      'senderId': senderId,
      'receiverId': receiverId,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      text: map['text'],
      room: map['room'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(id: $id, text: $text, room: $room, senderId: $senderId, receiverId: $receiverId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.text == text &&
        other.room == room &&
        other.senderId == senderId &&
        other.receiverId == receiverId &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        room.hashCode ^
        senderId.hashCode ^
        receiverId.hashCode ^
        date.hashCode;
  }
}
