import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'plant_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  bool isRegister = false;

  Future<void> handleAuth() async {
    try {
      if (isRegister) {
        await Supabase.instance.client.auth.signUp(email: emailCtrl.text, password: passCtrl.text);
        Get.snackbar("Sukses", "Pendaftaran berhasil!");
      } else {
        await Supabase.instance.client.auth.signInWithPassword(email: emailCtrl.text, password: passCtrl.text);
        Get.offAll(() => PlantPage());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isRegister ? "Register" : "Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passCtrl, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: handleAuth, child: Text(isRegister ? "Sign Up" : "Sign In")),
            TextButton(
              onPressed: () => setState(() => isRegister = !isRegister),
              child: Text(isRegister ? "Sudah punya akun? Login" : "Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}