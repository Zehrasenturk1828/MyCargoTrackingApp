import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class createcargo extends StatefulWidget {
  const createcargo({Key? key}) : super(key: key);

  @override
  State<createcargo> createState() => _createcargo();
}

class _createcargo extends State<createcargo> {
  TextEditingController sname = TextEditingController();
  TextEditingController ssurname = TextEditingController();
  TextEditingController sloc = TextEditingController();
  TextEditingController rname = TextEditingController();
  TextEditingController rsurname = TextEditingController();
  TextEditingController rloc = TextEditingController();
  TextEditingController cweight = TextEditingController();
  TextEditingController cwidth = TextEditingController();
  TextEditingController cheight = TextEditingController();
  TextEditingController csize = TextEditingController();

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
                Text('Cargo registration is successful..!'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
                sname.clear();
                ssurname.clear();
                sloc.clear();
                rname.clear();
                rsurname.clear();
                rloc.clear();
                cweight.clear();
                cwidth.clear();
                cheight.clear();
                csize.clear();
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
          title: Text("CREATE A NEW CARGO"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.card_giftcard_outlined,
                          color: Colors.white38,
                          size: 25,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "CREATE A NEW CARGO",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Sender Name...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                      controller: sname,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Sender Surname...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                      controller: ssurname,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Sender Location...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.location_on),
                      ),
                      controller: sloc,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Receiver Name...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                      controller: rname,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Receiver Surname...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.account_circle_rounded),
                      ),
                      controller: rsurname,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "-> Receiver Location...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.location_on),
                      ),
                      controller: rloc,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "-> Cargo Weight...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        icon: Icon(Icons.monitor_weight_rounded),
                      ),
                      controller: cweight,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Complete',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        {
                          String sename = sname.text;
                          String sesurname = ssurname.text;
                          String seloc = sloc.text;
                          String rename = rname.text;
                          String resurname = rsurname.text;
                          String reloc = rloc.text;
                          var carweight = cweight.text;
                          var carweight1 = int.parse(carweight);
                          dynamic carprice;
                          String carstatus="cargo received";
                          if (carweight1 >= 0.1 && carweight1 <= 999) {
                            carprice = 10;
                          } else if (carweight1 >= 1000 && carweight1 <= 1999) {
                            carprice = 20;
                          } else if (carweight1 >= 2000 && carweight1 <= 2999) {
                            carprice = 30;
                          } else {
                            carprice = 40;
                          }
                          Random r = new Random();
                          int cid = r.nextInt(100);

                          var cargo = {
                            "Uid": cid.toString(),
                            "sename": sename,
                            "sesurname": sesurname,
                            "seloc": seloc,
                            "rename": rename,
                            "resurname": resurname,
                            "reloc": reloc,
                            "carweight": carweight,
                            "carprice": carprice,
                            "carstatus":carstatus,
                          };
                          await FirebaseFirestore.instance
                              .collection("Kargo Bilgileri")
                              .doc(cid.toString())
                              .set(cargo)
                              .then(
                                (v) => AlertDialog(
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children:<Widget>[
                                        Text(
                                            "Cargo Tracking Number:$cid \n Cargo Price: $carprice"),
                                      ],
                                    ),
                                  ),
                                ),
                              ).whenComplete(() => _showMyDialog());
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
