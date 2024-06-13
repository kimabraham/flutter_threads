class UserModel {
  final String username;
  final String avatarUrl;
  final bool isOfficital;

  UserModel({
    required this.username,
    required this.avatarUrl,
    this.isOfficital = false,
  });
}

final UserModel firstMockUser = UserModel(
  username: 'Dan abramov',
  avatarUrl: 'https://avatars.githubusercontent.com/u/810438?v=4',
  isOfficital: true,
);
final UserModel secondMockUser = UserModel(
  username: 'Flutter',
  avatarUrl:
      'https://scontent.cdninstagram.com/v/t51.2885-19/357751940_659867238919659_3604128422017610897_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent.cdninstagram.com&_nc_cat=103&_nc_ohc=cJEdohRWHHoQ7kNvgGt2qlV&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYA0abjkOgxodQIuyFBIzG2ttfM0hcGWOLB9xx1L0OSVxw&oe=666D4342&_nc_sid=10d13b',
);
final UserModel thirdMockUser = UserModel(
  username: 'Coding dev',
  avatarUrl:
      'https://scontent.cdninstagram.com/v/t51.2885-19/357800343_1668845663629526_5737087681525203403_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent.cdninstagram.com&_nc_cat=102&_nc_ohc=V-BkoGEp-qcQ7kNvgFhPawZ&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYDv9VaHSOVbKWKk3fHDcOGAAxZKqiDohaDRTWmeyZvSMw&oe=666D5118&_nc_sid=10d13b',
);
final UserModel forthMockUser = UserModel(
  username: 'Coding Ninjas',
  avatarUrl:
      'https://scontent.cdninstagram.com/v/t51.2885-19/358000020_792782049170780_4202802959103722480_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent.cdninstagram.com&_nc_cat=108&_nc_ohc=verYMVlWSWkQ7kNvgFSFOaM&edm=APs17CUBAAAA&ccb=7-5&oh=00_AYB7IgS8q_0lGS-EfupniNBeOx05NY05sUQAEaMi31YrhA&oe=666D4014&_nc_sid=10d13b',
  isOfficital: true,
);
