// data/api_provider.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

class ApiProvider {
  final String baseUrl = "https://reqres.in/";

  Future<List<UserModel>> fetchUsers(int page) async {
    final response = await http.get(Uri.parse('${baseUrl}api/users?page=$page'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<UserModel> users = (data['data'] as List).map((json) => UserModel.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<UserModel> fetchUser(int userId) async {
    final response = await http.get(Uri.parse('${baseUrl}api/users/$userId'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UserModel.fromJson(data['data']);
    } else {
      throw Exception('Failed to load user');
    }
  }
}