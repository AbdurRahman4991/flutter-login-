import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpService {
  static Future<String?> verifyOtp(String email, String otp) async {
    try {
      final url = Uri.parse('http://192.168.20.203:4000/api/verify-otp');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'otp': otp,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['message'];
      } else {
        final data = jsonDecode(response.body);
        return data['message'] ?? 'OTP verification failed';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
