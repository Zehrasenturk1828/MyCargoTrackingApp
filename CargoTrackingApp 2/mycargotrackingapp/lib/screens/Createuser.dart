import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class createuser extends StatefulWidget {
  const createuser({Key? key}) : super(key: key);

  @override
  State<createuser> createState() => _createuser();
}

class _createuser extends State<createuser> {
  TextEditingController controlleruname = TextEditingController();
  TextEditingController controllerusurname = TextEditingController();
  TextEditingController controlleruemail = TextEditingController();
  TextEditingController controllerupassword = TextEditingController();

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Information'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Your registration is successful..!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
              controlleruemail.clear();
              controllerupassword.clear();
            },
          ),
        ],
      );
    },
  );
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  width: 500,
                  height: 500,
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
                            "CREATE NEW ACCOUNT",
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
                          hintText: "Enter your Name...",
                        ),
                        controller: controlleruname,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your Surname...",
                        ),
                        controller: controllerusurname,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your E-mail...",
                        ),
                        controller: controlleruemail,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Enter your Password...",
                        ),
                        obscureText: true,
                        controller: controllerupassword,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: ()async{
                {
                  String uemail=controlleruemail.text;
                  String upassword=controllerupassword.text;
                  String uname=controllerupassword.text;
                  String usurname=controllerupassword.text;
                  String K_role="user";
                  Random r=new Random();
                  int uid=r.nextInt(100);
                  
                      
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: uemail, password: upassword).
                    then((kullanici){
                      var kullanici={"Uid": uid, "Kname": uname, "Ksurname": usurname, "Kemail": uemail, "Kpassword": upassword, "Krole":K_role};
                      FirebaseFirestore.instance
                .collection("Users")
                .doc(uid.toString())
                .set(kullanici).whenComplete(() => _showMyDialog());
                    });
                       
                  }
                },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}
