import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NaaS API Calling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String msg = "Aperte o botão para uma desculpa aleatória";
  
  Future<void> naasCall() async {
    final url = Uri.parse('https://no-as-a-service-portuguese-ts.vercel.app/no');
    
    final res = await http.get(url);
  
    try {
      if (res.statusCode == 200) {
        setState(() {
          msg = jsonDecode(res.body)["reason"];
        });
      } else {
        setState(() {
          msg = "Erro HTTP: ${res.statusCode}";
        });
      }
    } catch (error) {
      setState(() {
        msg = "Erro inesperado: $error";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("App de Chamada ao NaaS"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => naasCall(), 
              child: Text("Gerar desculpa")
            )
          ],
        ),
      ) 
    );
  }
}
