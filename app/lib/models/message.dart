import 'package:chat_app/models/attachment.dart';

class MessageModel {
  const MessageModel(
      {required this.id,
      required this.userId,
      required this.content,
      required this.incoming,
      required this.attachments});

  final String id;
  final String userId;
  final String content;
  final bool incoming;
  final List<AttachmentModel> attachments;

  bool get hasAttachments => attachments.isNotEmpty;

  static MessageModel fromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String,
      userId: json['userId']as String,
      content: json['content']as String,
      incoming: json['incoming'] as bool,
      attachments: AttachmentModel.fromJsonArray(json['attachments']));

  static List<MessageModel> fromJsonArray(List<dynamic> jsonArray) =>
      jsonArray.map((json) => fromJson(json)).toList();
}
