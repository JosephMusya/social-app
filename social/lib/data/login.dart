import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/data/sharedPreferences.dart';
import 'package:social/views/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // ignore: prefer_const_constructors
      body: Login(),
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

    if (username == '') {
      const Login();
    } else {
      setUser();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage(username)));
    }
    controller.clear();
  }

  void setUser() async => await UserSharedPreferences.setUsername(username);

  @override
  void initState() {
    super.initState();
    UserSharedPreferences.init();
    username = UserSharedPreferences.getUsername() ?? '';
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
            suffixIcon:
                IconButton(onPressed: _submit, icon: const Icon(Icons.done)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: Colors.blue)),
          ),
        ),
      ),
    );
  }
}
