import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration:  BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xff2BDCCD),
              Color(0xff6D11EF)
            ], begin: Alignment.topLeft,
                end: Alignment.bottomLeft

            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 150,
              backgroundImage: AssetImage("assets/profile.jpeg"),
            ),
            Container(
              height: 200,
              child: Column(
                children: [
                  Text("Guy Gaga",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),),
                  Text("Age : 28",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),),
                  Text("Lived at Bangal",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
