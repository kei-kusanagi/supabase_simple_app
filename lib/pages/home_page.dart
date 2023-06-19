import 'package:flutter/material.dart';
import 'package:supabase_singin_singup_singout/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Hola mundo'),
          ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_card,
            size: 150,
          ),
          smallGap,
          const Text(
            'Supabase SingIn, SingUp and SingOut app',
            style: TextStyle(fontSize: 25),
          ),
          largeGap,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Sign In'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(200, 50)), // Tamaño mínimo personalizado
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('Sign Up'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(200, 50)), // Tamaño mínimo personalizado
                )),
          ),
        ],
      )),
    );
  }
}
