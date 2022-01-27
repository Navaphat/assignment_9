import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
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

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                child: Column(
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
                          child: Container(width: 75.0,height: 75.0,),
                        ),

                        buildButton(num: 0),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 75.0,
                            height: 75.0,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.backspace_outlined, color: Colors.grey,),
                              iconSize: 40.0,

                            ),
                          ),
                        ),
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
      ),
    );
  }
}

Widget buildButton({int? num}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      child: OutlineButton(
        onPressed: () {},
        shape: CircleBorder(),
        child: Text('${num.toString()}', style: TextStyle(fontSize: 25.0),),
      ),
    ),
  );
}