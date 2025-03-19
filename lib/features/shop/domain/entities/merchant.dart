class Merchant {
  final String id;
  final String username;
  final String name;
  final String email;
  final String gender;
  final String image;
  final String actoken;
  final String reftoken;

  Merchant(
      {required this.id,
      required this.username,
      required this.name,
      required this.email,
      required this.gender,
      required this.image,
      required this.actoken,
      required this.reftoken});
}
