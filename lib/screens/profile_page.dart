import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/change_password.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Align(alignment:Alignment.center,
      child:Column(
        children: [
              const SizedBox(height: 20),
              const Text(
              "Farmacia del Cambio",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
              const SizedBox(height: 50,),
              SizedBox(width: 500, height: 250,
              child:GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5,
                  crossAxisCount: 2,
                  children: <Widget>[
                  Text('Città: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.end,),
                  Text('Bari',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 30),textAlign: TextAlign.start,),
                  Text('Via: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.end,),
                  Text('Via Marco Polo',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 30),textAlign: TextAlign.start,),
                  Text('Partita IVA: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.end,),
                  Text('N0NCH0S0RD1',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 30),textAlign: TextAlign.start,), 
                  ],
                ),),
              const SizedBox(height: 50,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff023D74),
                    foregroundColor: Colors.white,
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: () => showDialog(context: context, builder: (BuildContext context) => ChangePass()), 
                  icon:const Icon(Icons.lock), 
                  label: const Text("Cambia Password ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),)),), //TODO: Change Password PopUp
              const SizedBox(height: 10,),
              Directionality(
                textDirection: TextDirection.rtl, 
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffCAE6FF),
                    foregroundColor: const Color(0xff023D74),
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: () { Navigator.pop(context);},
                  icon:const Icon(Icons.logout), 
                  label: const Text("Logout ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),)),),
      ],
      ),),);
    
  }
}