import 'package:flutter/material.dart';
import 'package:supabase_singin_singup_singout/utils/constant.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // [createUser]
  Future<bool> createUser({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signUp(
      email,
      password,
    );
    final error = response.error;
    if (error == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.perm_contact_cal_outlined,
              size: 150,
            ),
            largeGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
            ),
            smallGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                ),
              ),
            ),
            largeGap,
            OutlinedButton(
                onPressed: () async {
                  final userValue = await createUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  if (userValue == true) {
                    Navigator.pushReplacementNamed(context, '/signin');
                    context.ShowErrorMessage('Success');
                  }
                },
                child: const Text('Sign Up'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(200, 50)), // Tamaño mínimo personalizado
                )),
          ],
        ),
      ),
    );
  }
}
