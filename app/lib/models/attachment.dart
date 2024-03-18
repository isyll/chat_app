import 'package:chat_app/types/attachment_type.dart';

class Attachment {
  final AttachmentType type;
  final int size;

  const Attachment({required this.type, required this.size});
}
