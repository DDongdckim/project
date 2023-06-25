import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(),
        body: Container(
            child:Row(
              children: [
                Container(
                  width: 200,
                  height: 400,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 400,
                  color: Colors.orange,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.yellow,
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 200,
                              color: Colors.yellow,
                            ),
                            Container(
                              width: 100,
                              height: 200,
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.green,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 100,
                                          color: Colors.blue,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 100,
                                          color: Colors.purple,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

              ],
            )
        )
      ),
    );


    //     body:Center(
    //       child:Row(
    //         mainAxisAlignment: MainAxisAlignment. spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children:[
    //             Icon(Icons.star, color:Colors.blue),
    //             Icon(Icons.star, color:Colors.blue),
    //             Icon(Icons.star, color:Colors.blue),
    //             Icon(Icons.star, color:Colors.blue),
    //             Icon(Icons.star, color:Colors.blue),
    //         ]
    //       )
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     child: SizedBox(
    //       height: 70,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Icon(Icons.phone, color:Colors.teal),
    //           Icon(Icons.message, color: Colors.teal),
    //           Icon(Icons.contact_page, color:Colors.teal),
    //         ],
    //       ),
    //     ),
    // ),
    // ),

  }
}

