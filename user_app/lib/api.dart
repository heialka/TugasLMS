import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_app/models/user_model.dart';

class ApiService {
  Future<UserModel> fetchUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
