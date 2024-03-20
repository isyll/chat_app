import 'package:chat_app/models/attachment.dart';
import 'package:chat_app/models/user.dart';

class MessageModel {
  const MessageModel(
      {required this.id,
      required this.user,
      required this.content,
      required this.incoming,
      required this.attachments,
      required this.date});

  final String id;
  final UserModel user;
  final String content;
  final bool incoming;
  final List<AttachmentModel> attachments;
  final DateTime date;

  bool get hasAttachments => attachments.isNotEmpty;

  static MessageModel fromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as String,
      user: UserModel.fromJson(json['user']),
      content: json['content'] as String,
      incoming: json['incoming'] as bool,
      attachments: AttachmentModel.fromJsonArray(json['attachments']),
      date: DateTime.parse(json['date'] as String));

  static List<MessageModel> fromJsonArray(List<dynamic> jsonArray) =>
      jsonArray.map((json) => fromJson(json)).toList();
}
