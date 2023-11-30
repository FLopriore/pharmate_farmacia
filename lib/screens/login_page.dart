import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/nav_rail.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
              const SizedBox(height: 20),
              const Text(
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),
            Align(alignment: Alignment.center,
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff023D74),
                    foregroundColor: Colors.white,
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NavRail()),
            );
                  }, 
                  icon:const Icon(Icons.login), 
                  label: const Text("Login ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),),
            )
      ],
      )
    );
  }
}