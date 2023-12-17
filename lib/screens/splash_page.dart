import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/authorization/login_secure_storage.dart';
import 'package:pharmate_farmacia/data/api.dart';
import 'package:pharmate_farmacia/screens/old_login.dart';
import 'package:pharmate_farmacia/widgets/nav_rail.dart';

// Blank screen to login automatically if there are any stored tokens.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    // Check if there are any stored tokens.
    String? token =
        await LoginSecureStorage.getLoginSecureStorage('loginToken');
    if (token != null && token.isNotEmpty) {
      // Test if the token corresponds to an existing user.
      await CallApi().getData('users/me').then((value) {
        if (value != null) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NavRail()));
        }
      });
    } else {
      Future.delayed(
          const Duration(seconds: 1),
          () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginPage())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.shrink(),
    );
  }
}
