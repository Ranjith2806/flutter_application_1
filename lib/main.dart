import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';

  
void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAmBy73tT3hlrsDWEZhF3QgBBDFEjmRaKw",
      appId: "1:323320835022:web:2f8729434ba5fab66e199f", 
      messagingSenderId: "323320835022", 
      projectId: "fir-seven-a1e6b"
      ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness:Brightness.light, scaffoldBackgroundColor: Colors.white, useMaterial3: true),
      home: const HomePage(),
    );
  }
}