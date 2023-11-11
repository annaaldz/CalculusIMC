import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC MASCULINO',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
       home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IMC MASCULINO'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[ 
            Text('Anna Carolina Lima de Souza',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            Text('RA: 1431432312015',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            Text(
              'Informe seu peso (kg):',
            ),
            SizedBox(height: 10),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Text(
              'Informe sua altura (m):',
            ),
            SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Seu IMC é: $bmiResult',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Situação: ',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);

    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi;
    });
  }
}