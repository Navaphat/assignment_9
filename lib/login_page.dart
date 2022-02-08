import 'package:assignment_final/main_page.dart';
import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {

  loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final TextEditingController controller = TextEditingController();

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
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Text('กรุณาใส่รหัสผ่าน', style: TextStyle(fontSize: 25.0),),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$_inputPIN', style: TextStyle(fontSize: 25.0),),
          ),

          Expanded(
            child: Container(
              //color: Colors.blue,
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
                        child: Container(height: 75.0, width: 75.0,),
                      ),
                      buildButton(num: 0),
                      buildButton(num: -1),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('ลืมรหัสผ่าน', style: TextStyle(fontSize: 20.0, color: Colors.blue),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
      child = Icon(Icons.backspace_outlined, size: 30.0, color: Colors.grey,);
    }
    else {
      child = Text('${num}', style: TextStyle(fontSize: 20.0,),);
      boxDecoration = BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2.0),
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
        borderRadius: BorderRadius.circular(37.5),
        child: Container(
          width: 75.0,
          height: 75.0,
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
          });
      }
    }
}

  Widget buildPassCode({int? i}) {
    BoxDecoration? blankPass = BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey, width: 2.0),
    );

    BoxDecoration? fillPass = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey,
      border: Border.all(color: Colors.grey, width: 2.0),
    );

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 18.0,
        height: 18.0,
        decoration: (i! < _inputPIN.length)? fillPass : blankPass,
      ),
    );
  }
}