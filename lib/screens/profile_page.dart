import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/profile_entry.dart';

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
              /*
              const ProfileEntry(textParam: "Città: ", textEntry: 'Bari'),
              const ProfileEntry(textParam: "Via: ", textEntry: 'Via Marco Polo'),
              const ProfileEntry(textParam: "Partita IVA: ", textEntry: 'N0NCH0S0RD1'),*/

              /*
                  Text('Città: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('Bari',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,),
                  Text('Via: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('Via Marco Polo',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,),
                  Text('Partita IVA: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('N0NCH0S0RD1',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,), */
              SizedBox(width: 400, height: 250,
              child:GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5,
                  crossAxisCount: 2,
                  children: <Widget>[
                  Text('Città: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('Bari',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,),
                  Text('Via: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('Via Marco Polo',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,),
                  Text('Partita IVA: ',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.end,),
                  Text('N0NCH0S0RD1',style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 25),textAlign: TextAlign.start,), 
                  ],
                ),),
              const SizedBox(height: 50,),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff0888fd),
                    foregroundColor: Colors.white,
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: (){}, 
                  icon:const Icon(Icons.lock), 
                  label: const Text("Cambia Password ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),), //TODO: Change Password PopUp
              const SizedBox(height: 10,),
              Directionality(
                textDirection: TextDirection.rtl, 
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffCAE6FF),
                    foregroundColor: const Color(0xff0888fd),
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: () {},
                  icon:const Icon(Icons.add), 
                  label: const Text("Logout ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),),
      ],
      ),),);
    
  }
}