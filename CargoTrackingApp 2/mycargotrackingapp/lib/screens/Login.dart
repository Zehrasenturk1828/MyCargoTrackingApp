import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycargotrackingapp/screens/Adminekrani.dart';
import 'package:mycargotrackingapp/screens/Kullaniciekrani.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController kulemail = TextEditingController();
  TextEditingController kulpassword = TextEditingController();

  rolekontrol(){

  var query=FirebaseFirestore.instance.collection("Users").get().then((snapshot){
    snapshot.docs.forEach((result) { 
      if(result.data()['Krole']=='admin'){
        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Kullaniciekrani()),
                        (Route<dynamic> route) => false);
      }
      else if(result.data()['Krole']=='user')
      {
        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Adminekrani()),
                        (Route<dynamic> route) => false);
      }
      else{
        onError: (e) => print("There is no user record corresponding to this identifier.: $e");
      }

    });

  });

  }


  Future<void> login() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: kulemail.text, password: kulpassword.text)
        .then((kullanici) {
       rolekontrol();
          
         
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text("CARGOT TRACKING"),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 138, 145, 170),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.login,
                      color: Colors.white38,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "LOGIN FORM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "enter your email...",
                  ),
                  controller: kulemail,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "enter your password...",
                  ),
                  controller: kulpassword,
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: login,
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
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
