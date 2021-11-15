import 'package:flutter/material.dart';
import 'package:login_data/models/api_service.dart';
import 'package:login_data/models/request.dart';
import 'new_page.dart';
// ignore_for_file: prefer_const_constructors
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller1=TextEditingController();
  TextEditingController controller2=TextEditingController();
  bool a=false;
  bool hidePassword = true;
  final globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RequestLog obj=RequestLog(email: 'abc@gmail.com', password: 'abcd1212');
  @override
  void initState(){
    super.initState();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Center(child: const Text("Rest Api")),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            Text("Login",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            SizedBox(height: 20),
                            Form(
                              key: globalFormKey,
                              child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextFormField(
                                          controller: controller1,
                                          keyboardType: TextInputType.emailAddress,
                                          onSaved: (input)=>obj.email=input!,
                                          validator: (input)=> input!.contains("@") ? null : "Email id should be valid",
                                          decoration: InputDecoration(
                                            labelText: 'Email',
                                            prefixIcon: Icon(Icons.email,color: Colors.redAccent)
                                          ),
                                        ),
                                      ),
                                   Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: TextFormField(
                                          controller: controller2,
                                          obscureText: hidePassword,
                                          keyboardType: TextInputType.text,
                                          onSaved: (input)=>obj.password=input!,
                                          validator: (input)=> input!.length >3 ? null: "Password should be greater than 3",
                                          decoration: InputDecoration(
                                              labelText: 'Password',
                                              prefixIcon: Icon(Icons.password,color: Colors.redAccent),
                                            suffixIcon: IconButton(
                                              onPressed: (){
                                                setState(() {
                                                  hidePassword=!hidePassword;
                                                });
                                              },
                                                color: Colors.redAccent.withOpacity(0.4),
                                              icon: Icon(hidePassword?Icons.visibility_off: Icons.visibility),
                                            )
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 30),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red, // background
                                        onPrimary: Colors.white, // foreground
                                      ),
                                      onPressed: (){
                                        if(validateandsave()){
                                          ApiService apiobj=ApiService();
                                           apiobj.login(obj).then((value) => {
                                            if(value.token.isNotEmpty){
                                              if(controller1.text=="eve.holt@reqres.in"  && controller2.text=="cityslicka"){
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text('Login Successfully'),
                                                  ),
                                                ),
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => NewPage()),
                                                )

                                              }
                                            }
                                            else{
                                               ScaffoldMessenger.of(context).showSnackBar(
                                             SnackBar( content: Text("Error")
                                             ),
                                           ),
                                          throw Exception("error")
                                            }
                                          });
                                          print(obj.toJson());
                                        }
                                      },
                                      child: Text('Login',style: TextStyle(fontSize: 18),),
                                    )
                                  ],
                                ),
                            )
                          ],
                        ),
                    ),
                ),

             ]
            ),
        ]
        ),
      ),
    );
  }
  bool validateandsave(){
    final form=globalFormKey.currentState;
    if(form!.validate()){
      form.save();
      return true;
    }
    return false;
  }
}
