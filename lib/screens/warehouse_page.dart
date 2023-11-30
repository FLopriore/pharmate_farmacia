import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/add_stock.dart';
import 'package:pharmate_farmacia/widgets/rounded_background_rectangle.dart';
import 'package:pharmate_farmacia/widgets/custom_search_bar.dart';

class WarehousePage extends StatelessWidget {
  const WarehousePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        const SizedBox(height: 20),
        const Align(
            alignment: Alignment.center,
            child: Text(
              "Magazzino",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
        ),
        Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              const Expanded(child: SizedBox(height: 50,child: CustomSearchBar(),),),
              Directionality(
                textDirection: TextDirection.rtl,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff023D74),
                    foregroundColor: Colors.white,
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: (){}, 
                  icon:const Icon(Icons.search), 
                  label: const Text("Cerca ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),), //TODO: Filter the drugs using a query
              const SizedBox(width: 10,),
              Directionality(
                textDirection: TextDirection.rtl, 
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff023D74),
                    foregroundColor: Colors.white,
                    fixedSize: Size.fromHeight(45),
                  ),
                  onPressed: () => showDialog(context: context, builder: (BuildContext context) => DialogAddStock()),
                  icon:const Icon(Icons.add), 
                  label: const Text("Aggiungi Giacenza ",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),)),), //TODO: Pop up to insert a new drug to warehouse
              const SizedBox(width: 20,)
            ],
          ),
        ), 
         const Expanded(child:Padding(padding: EdgeInsets.symmetric(vertical: 20),child: RoundedBackgroundRectangle(child: Placeholder()),))
        ]
      ),
    );
  }
}