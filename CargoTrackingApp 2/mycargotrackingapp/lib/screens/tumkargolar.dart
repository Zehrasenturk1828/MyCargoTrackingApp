import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class cargo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ALL CARGOES"),),
      body: allcargoes(),

    );
    
  }
}

class allcargoes extends StatefulWidget {
  @override
    _allcargoesState createState() => _allcargoesState();
}

class _allcargoesState extends State<allcargoes> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Kargo Bilgileri').snapshots();

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
              title: Text(" Cargo Tracking Number :"+ data['Uid'].toString()),
              subtitle: Text(" Cargo Status :"+ data['carstatus'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}