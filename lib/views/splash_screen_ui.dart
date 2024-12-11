// ignore_for_file: prefer_const_constructors, annotate_overrides, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:money_tracking_project/views/welcome_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override

  void initState() {
    Future.delayed(
      Duration(
        seconds: 1
        
        ),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeUI(),
        ),
      ),
    );
    super.initState();
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xFF3E7C78), 
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                Text(
                  'Money Tracking',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.040,
                    // fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Text(
                  'รายรับรายจ่ายของฉัน',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Created by 6552410014',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  'DTI-SAU',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}