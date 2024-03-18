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
}
