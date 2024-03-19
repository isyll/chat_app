import 'package:chat_app/types/attachment_type.dart';

class Attachment {
  final String id;
  final AttachmentType type;
  final int size;

  const Attachment({required this.id, required this.type, required this.size});

  static AttachmentType stringToAttachmentType(String value) {
    switch (value.trim().toLowerCase()) {
      case 'image':
        return AttachmentType.image;
      case 'video':
        return AttachmentType.video;
      case 'document':
        return AttachmentType.document;
      case 'file':
        return AttachmentType.file;
      case 'link':
        return AttachmentType.link;
      case 'recording':
        return AttachmentType.recording;
      default:
        throw ArgumentError('Invalid attachment type: $value');
    }
  }

  static Attachment fromJson(Map<String, dynamic> json) => Attachment(
      id: json['id'] as String,
      type: stringToAttachmentType(json['type'] as String),
      size: json['size'] as int);

  static List<Attachment> fromJsonArray(List<dynamic> jsonArray) =>
      jsonArray.map((json) => fromJson(json)).toList();
}
