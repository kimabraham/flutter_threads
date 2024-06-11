import 'package:thread_clone/model/reply_model.dart';
import 'package:thread_clone/model/user_model.dart';

class ThreadModel {
  final UserModel writer;
  final String content;
  final List<String>? imageUrl;
  final int? likes;
  final DateTime createdAt;
  final List<ReplyModel>? replies;

  ThreadModel({
    required this.writer,
    required this.content,
    List<ReplyModel>? replies,
    List<String>? imageUrl,
    int? likes,
    required this.createdAt,
  })  : imageUrl = imageUrl ?? [],
        replies = replies ?? [],
        likes = likes ?? 0;
}

final List<ThreadModel> mockThreads = [
  ThreadModel(
    writer: firstMockUser,
    content:
        'my favorite thing about b*****y is how hackable (in the good old sense of the word) it is. check out jaz’s social graph visualizer (warning: takes a bit to load). imagine if twitter provided enough data to build userland tools like this!https://bsky.jazco.dev/atlas',
    imageUrl: [
      'https://pbs.twimg.com/media/GFrNOk4XoAAe0Bv?format=jpg&name=medium',
    ],
    replies: [
      ReplyModel(
        writer: secondMockUser,
        content: 'reple1',
        createdAt: DateTime(2024, 2, 8),
      ),
      ReplyModel(
        writer: thirdMockUser,
        content: 'reple2',
        createdAt: DateTime(2024, 2, 9),
      ),
    ],
    likes: 325,
    createdAt: DateTime(2024, 2, 7),
  ),
  ThreadModel(
    writer: secondMockUser,
    content:
        'Why do you guys think this happened? Comment the possible issues causing this below 👇 👀',
    imageUrl: [
      'https://scontent.cdninstagram.com/v/t51.29350-15/359737224_2157300351139275_7798822496800377793_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMTcweDY4NC5zZHIuZjI5MzUwIn0&_nc_ht=scontent.cdninstagram.com&_nc_cat=103&_nc_ohc=BGePbGymP0QQ7kNvgE0Yk47&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE0NTE0OTE2MTI1NDMwODA3Mg%3D%3D.2-ccb7-5&oh=00_AYAAFkD8Sr-bQb0snlHyCEc5mjJb7Ip2C9pTVUMn80sJiA&oe=666B6807&_nc_sid=10d13b',
    ],
    likes: 100,
    createdAt: DateTime(2024, 7, 12),
  ),
  ThreadModel(
    writer: thirdMockUser,
    content:
        'Semantic HTML involves using HTML tags that convey the meaning and structure of content rather than relying solely on visual presentation 💪✨ It promotes clear document structure, accessibility, SEO and code maintainability ✨',
    imageUrl: [
      'https://scontent.cdninstagram.com/v/t39.30808-6/411360868_17948161214737147_4206811234568158432_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi4xMDgweDEzNTAuc2RyLmYzMDgwOCJ9&_nc_ht=scontent.cdninstagram.com&_nc_cat=107&_nc_ohc=0cm-0331L_4Q7kNvgHksukl&edm=APs17CUAAAAA&ccb=7-5&ig_cache_key=MzI1OTAwMjg5NTYwNzg2NjEyNg%3D%3D.2-ccb7-5&oh=00_AYDeV_S5rtsMOePMbZ4cOFOax0Ei3v86fx-VOOVK8sT7OQ&oe=666B5A0D&_nc_sid=10d13b',
    ],
    replies: [
      ReplyModel(
          writer: forthMockUser,
          content:
              'Who puts menu in span?! Everyone known that the best website™ is a maze of divs. Preferably with thousands of css classes from Tailwind, so you could never theme it.',
          createdAt: DateTime(2023, 12, 18))
    ],
    likes: 50,
    createdAt: DateTime(2023, 12, 16),
  ),
  ThreadModel(
    writer: thirdMockUser,
    content:
        'Which one do you prefer for designing?1. Vanilla CSS 2. Bootstrap 3. Tailwind CSS 4. Bulma 5. Other',
    likes: 20,
    replies: [
      ReplyModel(
        writer: secondMockUser,
        content:
            'I think that bootstrap is better than tailwind css, change my mind.',
        createdAt: DateTime(2023, 10, 16),
      ),
      ReplyModel(
        writer: forthMockUser,
        content:
            'honestly, I expected Tailwind to be quite messy (it actually is), but in reality it deals with so much of headache',
        createdAt: DateTime(2023, 10, 16),
      ),
    ],
    createdAt: DateTime(2023, 10, 10),
  ),
  ThreadModel(
    writer: forthMockUser,
    content: 'For loop or While loop? 👇',
    likes: 6,
    replies: [
      ReplyModel(
        writer: firstMockUser,
        content: 'For loop is a while loop with better syntax',
        createdAt: DateTime(2024, 2, 20),
      ),
      ReplyModel(
        writer: thirdMockUser,
        content:
            'for (var i = 0; i < 1000; i++) {console.log("I Love Coding");}',
        createdAt: DateTime(2024, 2, 20),
      ),
      ReplyModel(
        writer: thirdMockUser,
        content: 'test reply 3',
        createdAt: DateTime(2024, 2, 20),
      ),
    ],
    createdAt: DateTime(2024, 2, 18),
  ),
  ThreadModel(
    writer: forthMockUser,
    content: 'Everyone trying to find the value of X',
    imageUrl: [
      'https://scontent.cdninstagram.com/v/t51.29350-15/361954175_292699223315877_1374513821500479312_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42OTB4Mzg4LnNkci5mMjkzNTAifQ&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=Kff36hsQ8x0Q7kNvgFfl7vl&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE1MzkxODQ3MDYyNjQ5MzIwOA%3D%3D.2-ccb7-5&oh=00_AYCb59luISuGmwOGyA6z5pYnx6fhrbbJKYE2aaZ4NXDuOQ&oe=666B71AC&_nc_sid=10d13b',
      'https://scontent.cdninstagram.com/v/t51.29350-15/361954175_292699223315877_1374513821500479312_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42OTB4Mzg4LnNkci5mMjkzNTAifQ&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=Kff36hsQ8x0Q7kNvgFfl7vl&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE1MzkxODQ3MDYyNjQ5MzIwOA%3D%3D.2-ccb7-5&oh=00_AYCb59luISuGmwOGyA6z5pYnx6fhrbbJKYE2aaZ4NXDuOQ&oe=666B71AC&_nc_sid=10d13b',
      'https://scontent.cdninstagram.com/v/t51.29350-15/361954175_292699223315877_1374513821500479312_n.jpg?stp=dst-jpg_e35&efg=eyJ2ZW5jb2RlX3RhZyI6ImltYWdlX3VybGdlbi42OTB4Mzg4LnNkci5mMjkzNTAifQ&_nc_ht=scontent.cdninstagram.com&_nc_cat=109&_nc_ohc=Kff36hsQ8x0Q7kNvgFfl7vl&edm=APs17CUBAAAA&ccb=7-5&ig_cache_key=MzE1MzkxODQ3MDYyNjQ5MzIwOA%3D%3D.2-ccb7-5&oh=00_AYCb59luISuGmwOGyA6z5pYnx6fhrbbJKYE2aaZ4NXDuOQ&oe=666B71AC&_nc_sid=10d13b'
    ],
    likes: 58,
    replies: [
      ReplyModel(
        writer: firstMockUser,
        content: 'X = undefined',
        createdAt: DateTime(2023, 7, 24),
      ),
      ReplyModel(
        writer: secondMockUser,
        content: 'X=',
        createdAt: DateTime(2023, 7, 24),
      ),
      ReplyModel(
        writer: thirdMockUser,
        content: 'X=0/0',
        createdAt: DateTime(2023, 8, 6),
      ),
    ],
    createdAt: DateTime(2023, 7, 24),
  ),
];
