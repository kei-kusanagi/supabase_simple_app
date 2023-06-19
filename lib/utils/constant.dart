import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final client = Supabase.instance.client;

const smallGap = SizedBox(
  height: 15,
);

const largeGap = SizedBox(
  height: 30,
);

extension ShowSnackBar on BuildContext {
  void ShowErrorMessage(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
