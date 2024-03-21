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

  static List<LatestMessageModel> filter(
      String searchTerm, List<LatestMessageModel> messages) {
    searchTerm = searchTerm.trim().toLowerCase();
    return searchTerm.isEmpty
        ? messages
        : messages
            .where((m) =>
                m.content.toLowerCase().contains(searchTerm) ||
                m.user.name.toLowerCase().contains(searchTerm))
            .toList();
  }
}
