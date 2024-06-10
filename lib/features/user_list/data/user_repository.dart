import 'package:http/http.dart' as http;
import 'dart:convert';

import 'user_model.dart';

class UserRepository {
  final http.Client client;

  UserRepository(this.client);

  Future<List<UserModel>> fetchUsers(int page) async {
    final response = await client.get(
      Uri.parse('https://reqres.in/api/users?page=$page'),
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final List<dynamic> usersJson = body['data'];
      return usersJson.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
