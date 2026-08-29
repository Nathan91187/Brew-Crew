class UserModel {
  final String uid;

  const UserModel({
    required this.uid
  });
}
class UserData{
  final String uid;
  final String name;
  final String sugars;
  final int strength;
  const UserData({
    required this.uid,
    required this.strength,
    required this.name,
    required this.sugars
  });
}