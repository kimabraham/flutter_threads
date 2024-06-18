class UserModel {
  final String id;
  final String username;
  final String avatarUrl;
  final bool isOfficital;
  late List<UserModel> follower;
  late List<UserModel> following;

  UserModel({
    required this.id,
    required this.username,
    required this.avatarUrl,
    this.isOfficital = false,
  });
}

final UserModel firstMockUser = UserModel(
  id: 'danabramov',
  username: 'Dan abramov',
  avatarUrl: 'https://avatars.githubusercontent.com/u/810438?v=4',
  isOfficital: true,
);

final UserModel secondMockUser = UserModel(
  id: "Flutter",
  username: 'Flutter',
  avatarUrl: 'https://avatars.githubusercontent.com/u/14101776?s=200&v=4',
);

final UserModel thirdMockUser = UserModel(
  id: 'codingdev',
  username: 'Coding dev',
  avatarUrl: 'https://avatars.githubusercontent.com/u/89719256?v=4',
);

final UserModel forthMockUser = UserModel(
  id: 'iamshaunjp',
  username: 'Shaun (Net Ninja)',
  avatarUrl: 'https://avatars.githubusercontent.com/u/9838872?v=4',
  isOfficital: true,
);

final UserModel currentUser = UserModel(
  id: 'kimkr88',
  username: "kimkr",
  avatarUrl: "https://avatars.githubusercontent.com/u/43990334?v=4",
);

void initializeFollowersAndFollowings() {
  currentUser.following = [firstMockUser, forthMockUser];
  currentUser.follower = [secondMockUser, thirdMockUser];

  firstMockUser.following = [thirdMockUser, forthMockUser];
  firstMockUser.follower = [secondMockUser];

  secondMockUser.following = [thirdMockUser, forthMockUser, currentUser];
  secondMockUser.follower = [firstMockUser, currentUser];

  thirdMockUser.following = [firstMockUser, forthMockUser];
  thirdMockUser.follower = [
    secondMockUser,
    currentUser,
  ];

  forthMockUser.following = [thirdMockUser, firstMockUser];
  forthMockUser.follower = [secondMockUser, currentUser];
}

final List<UserModel> allUsers = [
  currentUser,
  firstMockUser,
  secondMockUser,
  thirdMockUser,
  forthMockUser
];
