import 'package:allstore/productlistpage.dart';
import 'package:allstore/registerpage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Função para validar o email
    bool isEmailValid(String email) {
      final emailPattern = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      return emailPattern.hasMatch(email);
    }

    // Função para validar a senha
    bool isPasswordValid(String password) {
      final passwordPattern = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$');
      return passwordPattern.hasMatch(password);
    }

    // Validação simples de email e senha
    if (!isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email inválido.')),
      );
    } else if (!isPasswordValid(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('A senha deve ter pelo menos 8 caracteres.')),
      );
    } else {
      // Navega para a lista de produtos após um login bem-sucedido
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductListPage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login realizado com sucesso!')),
      );
    }
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
            child: ListView(children: <Widget>[
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/storelogo.png'),
              ),
              const SizedBox(height: 80),
              TextFormField(
                controller: _emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: "Email",
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
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const RegisterPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin =
                            Offset(1.0, 0.0); // Início da animação (da direita)
                        const end = Offset.zero; // Posição final (zero)
                        const curve = Curves.easeInOut; // Curva da animação

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  "Não tem uma conta? Cadastre-se",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: 2.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ])));
  }
}
