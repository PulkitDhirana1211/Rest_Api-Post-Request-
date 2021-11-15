import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors
class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("Rest Api")
        ),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hello there",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 30,
                ),

                TextButton(
                    child: Text("Go Back"),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(color: Colors.blue),
                            )
                        )
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }
                )
              ]
            ),
      ),
    );
  }
}
