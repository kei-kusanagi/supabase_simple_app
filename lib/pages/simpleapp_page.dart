import 'package:flutter/material.dart';
import 'package:supabase_singin_singup_singout/utils/constant.dart';

class SimpleAppPage extends StatefulWidget {
  const SimpleAppPage({Key? key}) : super(key: key);

  @override
  State<SimpleAppPage> createState() => _SimpleAppPageState();
}

class _SimpleAppPageState extends State<SimpleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Page'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              icon: const Icon(Icons.logout),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.supervised_user_circle,
              size: 150,
            ),
            smallGap,
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              'Hello ${client.auth.currentUser?.email?.split('@')[0]}',
              style: TextStyle(fontSize: 15),
            ),
            largeGap,
            OutlinedButton(
              onPressed: () {
                client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('Sign Out'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(200, 50)), // Tamaño mínimo personalizado
              ),
            ),
          ],
        ),
      ),
    );
  }
}
