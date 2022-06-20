import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class trackingcargo extends StatefulWidget {
  const trackingcargo({Key? key}) : super(key: key);

  @override
  State<trackingcargo> createState() => _trackingcargo();
}

class _trackingcargo extends State<trackingcargo> {
  TextEditingController controllercargono = TextEditingController();
  List<String> cargoes = [];

  getcargoes() async {
    var gcargoes = await FirebaseFirestore.instance
        .collection("Kargo Bilgileri")
        .where("carstatus", isEqualTo: controllercargono.value)
        .get()
        .then(
      (res) {
        res.docs.forEach((doc) {
          var veri = doc.data();
          print(veri["carstatus"]);
          cargoes.add(veri["carstatus"]);
        });
        print("Data received...");
      },
      onError: (e) => print("An error occurred while retrieving data: $e"),
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
                          "TRACK A CARGO",
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
                        hintText: "Enter your cargo tracking number...",
                      ),
                      controller: controllercargono,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        child: Text(
                          'Track',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () async {
                            ListView(children: [
                              
                            ]);
                        }),
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
