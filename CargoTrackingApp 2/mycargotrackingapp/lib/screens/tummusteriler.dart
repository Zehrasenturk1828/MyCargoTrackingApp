import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ALL USERS"),),
      body: allusers(),

    );
    
  }
}

class allusers extends StatefulWidget {
  @override
    _allusersState createState() => _allusersState();
}

class _allusersState extends State<allusers> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: Icon(Icons.add_box),
              title: Text("User Name Surname: "+data['Kname'].toString()+" "+data['Ksurname'].toString()),
              subtitle: Text("User Role: "+data['Krole'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}