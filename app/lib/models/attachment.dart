import 'package:chat_app/types/attachment_type.dart';

class Attachment {
  final String id;
  final AttachmentType type;
  final int size;

  const Attachment({required this.id, required this.type, required this.size});
}
