import 'package:flash_card/flash_card.dart';
import 'package:flash_card/list_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(child: FlashCardListItem(flashcards: flashCard)),
          Container(
            height: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }

  final List<FlashCard> flashCard = List.generate(
      5,
      (index) => FlashCard(
            key: Key(index.toString()),
            frontWidget: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://fn.vinhphuc.edu.vn/UploadImages/mnhoanglau/admin/anh%20nha.jpg?w=700',
                      width: 100,
                      height: 100,
                    ),
                    Text.rich(TextSpan(
                        text: 'Nghĩa:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: 'Ngôi nhà',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ])),
                    Text.rich(TextSpan(
                        text: 'Phiên âm:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: '/həʊm/',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ])),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 2),
                                spreadRadius: 1,
                                blurRadius: 15)
                          ]),
                      child: Center(
                          child: Icon(Icons.volume_down_sharp,
                              color: Colors.blue)),
                    ),
                  ],
                )),
            backWidget: Container(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Home $index',
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            width: 300,
            height: 400,
          ));
}
