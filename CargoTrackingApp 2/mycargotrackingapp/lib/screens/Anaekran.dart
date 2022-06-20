import 'package:flutter/material.dart';
import 'package:mycargotrackingapp/screens/Createuser.dart';
import 'package:mycargotrackingapp/screens/Login.dart';

class Anaekran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('CARGOT TRACKING'),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Admin Login Page",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Users Login Page",
                    style: TextStyle(fontSize: 20),
                  ),
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
                    "Create User",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
