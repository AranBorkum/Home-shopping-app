import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? usernameController;
  TextEditingController? passwordController;

  InputDecoration usernameDecorator =
      InputDecoration(hintText: "Email address");
  InputDecoration passwordDecorator = InputDecoration(hintText: "Password");

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: usernameDecorator,
            ),
            TextField(
              controller: passwordController,
              decoration: passwordDecorator,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
