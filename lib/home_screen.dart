import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart'; 

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), // Çıkış yaptıktan sonra giriş ekranına yönlendir
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Renkli Logo
              Icon(
                Icons.home,
                size: 100,
                color: Colors.deepOrangeAccent,
              ),
              SizedBox(height: 40),
              // Başlık
              Text(
                "Hoşgeldiniz!",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Hoş geldiniz.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.teal[600]),
              ),
              SizedBox(height: 40),
              // Çıkış yap Butonu
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.deepPurpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Çıkış Yap Butonu
                    ElevatedButton(
                      onPressed: () => logout(context),
                      child: Text(
                        "Çıkış Yap",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.red[700],
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Hesabınızdan çıkış yapın Linki
                    TextButton(
                      onPressed: () => logout(context), // Çıkış yap butonu altındaki buton
                      child: Text(
                        "Hesabınızdan çıkış yapın",
                        style: TextStyle(color: Colors.teal[600], fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
