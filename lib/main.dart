import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'login_page.dart';
import 'plant_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await initializeDateFormatting('id_ID', null);


  await dotenv.load(fileName: ".env");


  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlantCare Pro',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green, brightness: Brightness.light),
      darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green, brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: session == null ? const LoginPage() : PlantPage(),
    );
  }
}