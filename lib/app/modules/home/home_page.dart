import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
            height: 640,
            width: 360,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(221, 194, 241, 204),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.school,
                  size: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Boletim escolar',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '2022',
                  style: TextStyle(
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/studentInformation');
                  },
                  elevation: 3.0,
                  fillColor: Colors.green,
                  padding: const EdgeInsets.all(8.0),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
