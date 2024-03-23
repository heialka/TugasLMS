class UserModel {
  final String firstName;
  final String lastName;
  final String gender;
  final String city;
  final String country;
  final String picture;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.city,
    required this.country,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['results'][0]['name']['first'],
      lastName: json['results'][0]['name']['last'],
      gender: json['results'][0]['gender'],
      city: json['results'][0]['location']['city'],
      country: json['results'][0]['location']['country'],
      picture: json['results'][0]['picture']['large'],
    );
  }
}
