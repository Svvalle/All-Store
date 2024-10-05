import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    final passwordPattern = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$');
    return passwordPattern.hasMatch(password);
  }

  void _register() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String username = _usernameController.text.trim();

    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos.')),
      );
      return;
    }

    if (!_isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email inválido. Por favor, insira um email válido.')),
      );
      return;
    }

    if (!_isPasswordValid(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('A senha deve ter pelo menos 8 caracteres, incluindo letras e números.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cadastro realizado com sucesso!')),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 40,
          right: 40,
        ),
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 50),
            const Text(
              "Cadastre-se",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            TextFormField(
              controller: _usernameController,
              autofocus: true,
              keyboardType: TextInputType.name,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                labelText: "Nome",
                hintText: "Ex: Pedro Silva Campos",
                hintStyle: TextStyle(
                  color: Colors.black12,
                  fontSize: 15,
                ),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Ex: fernanda123@gmail.com",
                hintStyle: TextStyle(
                  color: Colors.black12,
                  fontSize: 15,
                ),
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              autofocus: true,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              decoration: const InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 60.0,
              child: ElevatedButton(
                onPressed: _register,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Cadastrar",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
