import 'package:chat_app/models/attachment.dart';

class Message {
  const Message(
      {required this.id,
      required this.userId,
      required this.content,
      required this.incoming,
      required this.attachments});

  final String id;
  final String userId;
  final String content;
  final bool incoming;
  final List<Attachment> attachments;

  bool get hasAttachments => attachments.isNotEmpty;

  static Message fromJson(Map<String, dynamic> json) => Message(
      id: json['id'] as String,
      userId: json['userId']as String,
      content: json['content']as String,
      incoming: json['incoming'] as bool,
      attachments: Attachment.fromJsonArray(json['attachments']));

  static List<Message> fromJsonArray(List<dynamic> jsonArray) =>
      jsonArray.map((json) => fromJson(json)).toList();
}
