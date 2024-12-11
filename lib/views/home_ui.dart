// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_tracking_project/models/money.dart';
import 'package:money_tracking_project/models/user.dart';
import 'package:money_tracking_project/services/call_api.dart';
import 'package:money_tracking_project/views/subviews/income_view.dart';
import 'package:money_tracking_project/views/subviews/main_view.dart';
import 'package:money_tracking_project/views/subviews/outcome_view.dart';

class HomeUI extends StatefulWidget {
  User? user;
  Money? money;
    HomeUI({super.key, this.user, this.money});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _selectedIndex = 1;
  
  List<Widget> get _showView => [
      IncomeView(user: widget.user), 
      MainView(user: widget.user),  
      OutcomeView(user: widget.user), 
];
  
  Future<List<Money>>? moneyData;

  //สร้างฟังก์ชันเรียกใช้API
  // getAllMoneyByuserId(Money money) {
  //   setState(() {
  //     moneyData = CallAPI.callgetAllMoneyByuserId(money);
  //   });
  // }
  @override
  // void initState() {
  //   Money money = Money(
  //     // userId: widget.user!.userId,
  //   );
  //   getAllMoneyByuserId(money);
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showView[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.indent),
            label: 'Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.outdent),
            label: 'Outcome',
          ),
        ],
        
        backgroundColor: const Color.fromARGB(255, 54, 137, 131), 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;            
          });
        },
      ),
    );
  }
}
