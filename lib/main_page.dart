
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Mobius', style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('来て,かわいいラットさん', style: TextStyle(color: Colors.yellow, fontSize: 35),),
                ),
              ],
            ),
          ),

          Container(
            child: Image.asset('assets/images/Mobius.jpg', width: 700,),
          ),

          Expanded(
              child: Container(
                child: Text('メビウス', style: TextStyle(color: Colors.green,fontSize: 30.0),),
              ),
          ),
        ],
      ),
    );
  }
}
