import 'package:dyshez_app/screens/Create_account/create_account_screen.dart';
import 'package:dyshez_app/screens/Login/login_screen.dart';
import 'package:dyshez_app/screens/Order_view/Order_view_screen.dart';
import 'package:dyshez_app/screens/Quick_menu/order_history_screen.dart';
import 'package:dyshez_app/screens/Reset_password/reset_password_screen.dart';
import 'package:dyshez_app/screens/Sign_up/sign_up_screen.dart';
import 'package:dyshez_app/screens/Verify_new_password/verify_new_password.dart';
import 'package:dyshez_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://hhhjszwfnxewvrprazpp.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhoaGpzendmbnhld3ZycHJhenBwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk1NDc2NjUsImV4cCI6MjAzNTEyMzY2NX0.9XlWUKKC3VupKJthJkQyiNNiJMQ-aW72Mge9lJeC6Ak",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute:
          supabaseClient.auth.currentSession != null ? "order_history" : "/",
      routes: {
        '/': (context) => const LoginScreen(),
        'order_view': (context) => const OrdenViewScreen(),
        'create_account': (context) => const CreateAnAccountScreen(),
        'order_history': (context) => const OrderHistory(),
        'reset_password': (context) => const ResetPassword(),
        'signup': (context) => const SignUpScreen(),
        'Verify_new_password': (context) => const VerifyNewPassword(),
      },
    );
  }
}
