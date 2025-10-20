import 'package:flutter/material.dart';
import '/services/register_api_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isLoading = false;

  Future<void> handleRegister() async {
  if (!_formKey.currentState!.validate()) {
    return;
  }

  setState(() => isLoading = true);

  final message = await ApiService.registerUser(
    nameController.text.trim(),
    emailController.text.trim(),
    passwordController.text.trim(),
    confirmController.text.trim(),
  );
  print("🚀 Registration response: $message");
  setState(() => isLoading = false);

  // দেখানো বার্তা
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message ?? "Unknown error")),
  );

  if ((message ?? '').toLowerCase().contains("registration successful")) {
  final userEmail = emailController.text.trim();

  nameController.clear();
  emailController.clear();
  passwordController.clear();
  confirmController.clear();
  _formKey.currentState?.reset();

  Navigator.pushNamed(
    context,
    '/verify-otp',
    arguments: {'email': userEmail},
  );

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Registration successful")),
  );
}

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900]!,
              Colors.blue[800]!,
              Colors.blue[400]!,
            ],
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
                    Text("Register", style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 40),

                        _buildInputField(
                          "Name",
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Name is required";
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        _buildInputField(
                          "Email",
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) return "Email is required";
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return "Enter a valid email";
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        _buildInputField(
                          "Password",
                          controller: passwordController,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.length < 6) return "Minimum 8 characters required";
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        _buildInputField(
                          "Confirm password",
                          controller: confirmController,
                          isPassword: true,
                          validator: (value) {
                            if (value != passwordController.text) return "Passwords do not match";
                            return null;
                          },
                        ),

                        const SizedBox(height: 40),

                        GestureDetector(
                          onTap: isLoading ? null : handleRegister,
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Already have an account? Login",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String hint, {
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(225, 95, 27, .3),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
