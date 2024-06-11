import 'package:thread_clone/model/user_model.dart';

class ReplyModel {
  final UserModel writer;
  final String content;
  final DateTime createdAt;

  ReplyModel({
    required this.writer,
    required this.content,
    required this.createdAt,
  });
}
