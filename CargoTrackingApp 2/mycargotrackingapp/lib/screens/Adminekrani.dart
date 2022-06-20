import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mycargotrackingapp/screens/Anaekran.dart';
import 'package:mycargotrackingapp/screens/Createuser.dart';
import 'package:mycargotrackingapp/screens/Kargoekleme.dart';
import 'package:mycargotrackingapp/screens/adduser.dart';
import 'package:mycargotrackingapp/screens/trackingcargo.dart';
import 'package:mycargotrackingapp/screens/tumkargolar.dart';
import 'package:mycargotrackingapp/screens/tummusteriler.dart';

class Adminekrani extends StatelessWidget {
  const Adminekrani({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('CARGOT TRACKING'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => trackingcargo(),
                      ),
                    );
                  },
                  child: Text(
                    "Cargo Tracking",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => createuser(),
                      ),
                    );
                  },
                  child: Text(
                    "Add a user",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => cargo(),
                      ),
                    );
                  },
                  child: Text(
                    "See all cargo",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => user(),
                      ),
                    );
                  },
                  child: Text(
                    "See all users",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => createcargo(),
                      ),
                    );
                  },
                  child: Text(
                    "Add a cargo",
                    style: TextStyle(fontSize: 20),
                  ),
                  
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((deger) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => Anaekran()),
                          (Route<dynamic> route) => false);
                    });
                  },
                  child: Text(
                    "Sign out",
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
