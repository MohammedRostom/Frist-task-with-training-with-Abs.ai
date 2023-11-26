class UserinfoModel {
  final String username;
  final String Email;
  final String Password;
  String? userid;

  UserinfoModel(
      {required this.username,
      required this.Email,
      required this.Password,
      this.userid});
}
