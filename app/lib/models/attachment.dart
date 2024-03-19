import 'package:chat_app/types/attachment_type.dart';

class AttachmentModel {
  final String id;
  final AttachmentType type;
  final int size;

  const AttachmentModel({required this.id, required this.type, required this.size});

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

  static AttachmentModel fromJson(Map<String, dynamic> json) => AttachmentModel(
      id: json['id'] as String,
      type: stringToAttachmentType(json['type'] as String),
      size: json['size'] as int);

  static List<AttachmentModel> fromJsonArray(List<dynamic> jsonArray) =>
      jsonArray.map((json) => fromJson(json)).toList();
}
