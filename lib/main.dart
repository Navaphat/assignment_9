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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          Expanded(
            child: Container(
              //color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i = 1; i <= 3; i++) buildButton4(num: i),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i = 4; i <= 6; i++) buildButton4(num: i),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(var i = 7; i <= 9; i++) buildButton4(num: i),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(width: 75.0,height: 75.0,),
                      ),

                      buildButton4(num: 0),

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
    );
  }
}

// Widget buildButton({int? num}) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       width: 75.0,
//       height: 75.0,
//       child: OutlineButton(
//         onPressed: () {},
//         //shape: ,
//         child: Text('${num.toString()}', style: TextStyle(fontSize: 25.0),),
//       ),
//     ),
//   );
// }

Widget buildButton4({int? num}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      child: OutlineButton(
        onPressed: () {},
        shape: CircleBorder(),
        child: Text('${num.toString()}', style: TextStyle(fontSize:25.0),),
      ),
      //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // สีเงา
              offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
              blurRadius: 4.0,
              spreadRadius: 2.0,
            )
          ]
      ),
    ),
  );
}