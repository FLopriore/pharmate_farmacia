import 'package:flutter/material.dart';
import 'package:pharmate_farmacia/widgets/custom_icon.dart';
import 'package:pharmate_farmacia/screens/orders_page.dart';

class NavRail extends StatefulWidget {
  const NavRail({super.key});

  @override
  State<NavRail> createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int currentPageIndex = 1; //Start page is Ordini

  changeDestination(int index){
    setState(() {
      currentPageIndex = index;
    });
  }

  final navScreens = [OrdersPage(),Placeholder(),Placeholder()];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: [
        NavigationRail(
        selectedLabelTextStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black,), //TODO: Change Font 
        unselectedLabelTextStyle: const TextStyle(fontWeight: FontWeight.normal,color:Colors.black),
        labelType: NavigationRailLabelType.all,
        elevation: 3,
        onDestinationSelected: changeDestination,
        minWidth: 90,
        destinations: const <NavigationRailDestination>[
          NavigationRailDestination(
                  icon: Icon(Icons.local_shipping_outlined),
                  selectedIcon: Icon(Icons.local_shipping),
                  label: Text('Ordini'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.warehouse_outlined),
                  selectedIcon: Icon(Icons.warehouse),
                  label: Text('Magazzino'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profilo'),
                ),
        ], 
        selectedIndex: currentPageIndex,
        leading: const Padding(padding: EdgeInsets.only(top: 10,bottom: 40),child: CustomIcon(icon: "assets/logo_no_background.png",)) //TODO:Use Pharmate logo as leading
        ), 
        const VerticalDivider(thickness: 1,width: 1,),
        Expanded(child: navScreens[currentPageIndex],),
        ],
    )
    );
  }
}