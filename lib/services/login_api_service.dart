import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<void> loginUser(BuildContext context, String email, String password) async {
  final url = Uri.parse('http://192.168.20.203:4000/api/login');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['access_token'];
      final user = data['user'];

      // ✅ টোকেনসহ Welcome পেজে পাঠানো
      Navigator.pushNamed(
        context,
        '/welcome',
        arguments: {'token': token},
      );

    } else if (response.statusCode == 403) {
      _showErrorDialog(context, "Email is not verified");
    } else {
      final data = jsonDecode(response.body);
      final error = data['message'] ?? "Login Failed";
      _showErrorDialog(context, error);
    }
  } catch (e) {
    _showErrorDialog(context, "Internal server error");
  }
}


void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Error"),
      content: Text(message),
      actions: [
        TextButton(
          child: const Text("Ok"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
