import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_singin_singup_singout/pages/home_page.dart';
import 'package:supabase_singin_singup_singout/pages/signin_page.dart';
import 'package:supabase_singin_singup_singout/pages/signup_page.dart';
import 'package:supabase_singin_singup_singout/pages/simpleapp_page.dart';
import 'package:supabase_singin_singup_singout/utils/constant.dart';

const YOUR_SUPABASE_URL = 'https://glpszmjkexcvvetzgzas.supabase.co';
const YOUR_SUPABASE_ANON_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdscHN6bWprZXhjdnZldHpnemFzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODY5NjczNDYsImV4cCI6MjAwMjU0MzM0Nn0.nHu1LQxRpso8Jr9ukZuAl3nouHBC4GeV2qSwDoksG2c';

void main() async {
  await Supabase.initialize(
    url: YOUR_SUPABASE_URL,
    anonKey: YOUR_SUPABASE_ANON_KEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Supabase Sing-In-Up-Out',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          cardColor: Colors.green,
          iconTheme: IconThemeData(
            color: Colors.greenAccent,
          )),
      initialRoute: client.auth.currentSession != null ? 'simpleapp' : '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signin': (context) => const SignInPage(),
        '/signup': (context) => const SignUpPage(),
        '/simpleapp': (context) => const SimpleAppPage(),
      },
    );
  }
}
