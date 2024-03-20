import 'package:chat_app/models/message.dart';

class LatestMessageModel extends MessageModel {
  const LatestMessageModel(
      {required super.id,
      required super.user,
      required super.content,
      required super.incoming,
      required super.date,
      required super.attachments,
      required this.unread});

  final int unread;
}
