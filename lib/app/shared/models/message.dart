import 'dart:convert';

class Message {
  final String id;
  final String text;
  final String room;
  final String senderId;
  final String senderSocketId;
  final String receiverId;
  final String receiverSocketId;
  final DateTime date;
  Message({
    required this.id,
    required this.text,
    required this.room,
    required this.senderId,
    required this.senderSocketId,
    required this.receiverId,
    required this.receiverSocketId,
    required this.date,
  });

  Message copyWith({
    String? id,
    String? text,
    String? room,
    String? senderId,
    String? senderSocketId,
    String? receiverId,
    String? receiverSocketId,
    DateTime? date,
  }) {
    return Message(
      id: id ?? this.id,
      text: text ?? this.text,
      room: room ?? this.room,
      senderId: senderId ?? this.senderId,
      senderSocketId: senderSocketId ?? this.senderSocketId,
      receiverId: receiverId ?? this.receiverId,
      receiverSocketId: receiverSocketId ?? this.receiverSocketId,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'room': room,
      'senderId': senderId,
      'senderSocketId': senderSocketId,
      'receiverId': receiverId,
      'receiverSocketId': receiverSocketId,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      text: map['text'],
      room: map['room'],
      senderId: map['senderId'],
      senderSocketId: map['senderSocketId'],
      receiverId: map['receiverId'],
      receiverSocketId: map['receiverSocketId'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(id: $id, text: $text, room: $room, senderId: $senderId, senderSocketId: $senderSocketId, receiverId: $receiverId, receiverSocketId: $receiverSocketId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.text == text &&
        other.room == room &&
        other.senderId == senderId &&
        other.senderSocketId == senderSocketId &&
        other.receiverId == receiverId &&
        other.receiverSocketId == receiverSocketId &&
        other.date == date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        room.hashCode ^
        senderId.hashCode ^
        senderSocketId.hashCode ^
        receiverId.hashCode ^
        receiverSocketId.hashCode ^
        date.hashCode;
  }
}
