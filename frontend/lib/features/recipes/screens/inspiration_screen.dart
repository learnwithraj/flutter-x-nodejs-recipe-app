import 'package:flutter/material.dart';

import '../widgets/inspiration_app_bar.dart';

class InspirationScreen extends StatelessWidget {
  const InspirationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: InspirationAppBar(),
      ),
      body: Column(
        children: [
          //trending section here


          //you may like section here


          //master chef choice section here

          
        ],
      ),
    );
  }
}
