import 'package:flutter/material.dart';
import 'package:supabase_singin_singup_singout/utils/constant.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  // [userLogin] function
  Future<String?> userLogin({
    required final String email,
    required final String password,
  }) async {
    final response = await client.auth.signIn(
      email: email,
      password: password,
    );
    final user = response.data?.user;
    return user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_card,
              size: 150,
            ),
            largeGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 22),
                  hintText: 'e@mail.com',
                  hintStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            largeGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 22),
                  // hintText: 'Password',
                ),
              ),
            ),
            largeGap,
            isLoading
                ? Container(
                    height: 30,
                    width: 30,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : OutlinedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      dynamic loginValue = await userLogin(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      setState(() {
                        isLoading = false;
                      });
                      if (loginValue != null) {
                        Navigator.pushReplacementNamed(context, '/simpleapp');
                      } else {
                        context.ShowErrorMessage(
                            'Invalid Email or Password!!!');
                      }
                    },
                    child: Text('Sign In'),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                          Size(200, 50)), // Tamaño mínimo personalizado
                    ))
          ],
        ),
      ),
    );
  }
}
