import 'package:flutter/material.dart';
import 'package:social/views/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  TextEditingController controller = TextEditingController();
  void _submit() {
    username = controller.text;
    // controller.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          style: const TextStyle(fontSize: 18),
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.person),
            suffixIcon: IconButton(onPressed: _submit, icon: Icon(Icons.done)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.blue)),
          ),
        ),
      ),
    );
  }
}
