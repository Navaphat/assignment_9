import 'package:assignment_final/main_page.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {

  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  String _inputPIN = '';
  static const _PIN = '123456';

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 125.0,
                        color: Colors.green,
                      ),
                    ],
                  ),

                  Text('LOGIN', style: TextStyle(color: Colors.green, fontSize: 40.0),),
                  Text('Enter PIN to login', style: TextStyle(fontSize: 18.0, color: Colors.green),),
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var i = 0; i < 6; i++) buildPassCode(i: i),
            ],
          ),

          Container(
            //color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i = 1; i <= 3; i++) buildButton(num: i),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i = 4; i <= 6; i++) buildButton(num: i),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i = 7; i <= 9; i++) buildButton(num: i),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(height: 70.0, width: 70.0,),
                    ),
                    buildButton(num: 0),
                    buildButton(num: -1),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                      child: TextButton(
                        onPressed: () {

                        },
                        child: Text('Forget PIN', style: TextStyle(fontSize: 20.0, color: Colors.yellow),),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildButton({int? num}) {

    Widget? child;
    BoxDecoration? boxDecoration;

    if(num == -1) {
      child = Icon(Icons.backspace_outlined, size: 30.0, color: Colors.green,);
    }
    else {
      child = Text('${num}', style: TextStyle(fontSize: 20.0, color: Colors.green),);
      boxDecoration = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green, width: 2.0),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (num != -1 && _inputPIN.length != 6) {
                _inputPIN += '$num';
            }
            else if (num == -1)
                _inputPIN = _inputPIN.substring(0, _inputPIN.length - 1);
          });
          checkPin();
        },
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          width: 70.0,
          height: 70.0,
          decoration: boxDecoration,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }

  checkPin() {
    if(_inputPIN.length == 6) {
      if(_inputPIN == _PIN) {
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            _inputPIN = '';
          });
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage()
            ),
          );
        });
      }
      else {
          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              _inputPIN = '';
            });

            showDialog(context: context, barrierDismissible: false, builder: (BuildContext context, ) {
              return AlertDialog(
                backgroundColor: Colors.yellow,
                title: Text('Incorrect PIN'),
                content: Text('Please try again'),

                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Ok', style: TextStyle(color: Colors.black),)
                  ),
                ],
              );
            });
          });
      }
    }
}

  Widget buildPassCode({int? i}) {
    BoxDecoration? blankPass = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.green, width: 2.0),
    );

    BoxDecoration? fillPass = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.green,
      border: Border.all(color: Colors.green, width: 2.0),
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0, left: 10.0, right: 10.0),
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: (i! < _inputPIN.length)? fillPass : blankPass,
      ),
    );
  }
}