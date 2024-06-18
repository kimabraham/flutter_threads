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

final List<ReplyModel> mockReplies = [
  ReplyModel(
    writer: firstMockUser,
    content: 'first Reply mock',
    createdAt: DateTime(2024, 6, 16, 3, 5),
  ),
  ReplyModel(
    writer: secondMockUser,
    content: 'second Reply mock',
    createdAt: DateTime(2024, 6, 16, 4, 5),
  ),
  ReplyModel(
    writer: thirdMockUser,
    content: 'third Reply mock',
    createdAt: DateTime(2024, 6, 16, 6, 5),
  ),
  ReplyModel(
    writer: forthMockUser,
    content: 'forth Reply mock',
    createdAt: DateTime(2024, 6, 16, 20, 5),
  ),
];
