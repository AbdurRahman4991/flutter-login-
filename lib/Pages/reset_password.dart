import 'package:flutter/material.dart';
import '/services/reset_password_api_service.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  String? token;

  @override
  void initState() {
    super.initState();

    // ✅ Hash routing থেকে token ও email parse করা
    final Uri baseUri = Uri.base; // e.g. http://localhost:59307/#/reset-password?token=...&email=...
    final String fragment = baseUri.fragment; // "#/reset-password?token=...&email=..."
    final Uri fragmentUri =
        Uri.parse(fragment.startsWith('/') ? fragment.substring(1) : fragment);

    final email = fragmentUri.queryParameters['email'];
    token = fragmentUri.queryParameters['token'];

    if (email != null) emailController.text = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [Colors.blue[900]!, Colors.blue[800]!, Colors.blue[400]!],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Reset Password",
                        style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text("Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 40),
                      _buildInputField("Email address", controller: emailController),
                      const SizedBox(height: 20),
                      _buildInputField("Password",
                          isPassword: true, controller: passwordController),
                      const SizedBox(height: 20),
                      _buildInputField("Confirm password",
                          isPassword: true, controller: confirmController),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () async {
                          if (token == null || emailController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Invalid reset link")));
                            return;
                          }

                          final result = await ResetPasswordService.resetPassword(
                            email: emailController.text,
                            token: token!,
                            password: passwordController.text,
                            confirmPassword: confirmController.text,
                          );

                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(result)));
                        },
                        child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                              child: Text("Reset Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("Back to Login",
                            style: TextStyle(color: Colors.grey[600])),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint,
      {bool isPassword = false, required TextEditingController controller}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color.fromRGBO(225, 95, 27, .3),
              blurRadius: 20,
              offset: Offset(0, 10)),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
