import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:task4/api.dart';
import 'package:task4/loginpaige.dart';

void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final nme = TextEditingController();
  final eml = TextEditingController();
  final num = TextEditingController();
  final pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: nme,
                            
                                              decoration: InputDecoration(
                                                
                          labelText: "Name",
                          border: OutlineInputBorder(),
                        
                                              ),
                                            ),
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: eml,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: num,
                        decoration: InputDecoration(
                          labelText: "Number",
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: pwd,
                        decoration: InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder()
                        ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      fetchposts();
                    }, child: Text("Sign in")),
                    ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Loginpaige()));
                    }, child: Text("login"))
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  fetchposts()async{
 final name = nme.text;
 final email = eml.text;
 final number = num.text;
 final password = pwd.text;

 if(name.isEmpty){
showerrormg("Name is empty");
 }
 else if (email.isEmpty){
  showerrormg("email is empty");
 }
 else if(number.isEmpty){
  showerrormg("Number is empty");
 }
 else if(password.isEmpty){
  showerrormg("Password is empty");
 }
 else {
  final frmdata = FormData.fromMap(
    {
      "name":name,
      "email":email,
      "mobile":number,
      "password":password
    }
  );
    final  response = await Apiclass().registerUserApi(frmdata);
    print("${response}");
    if (response != null){
      showsucessmsg(response.message!);
    }
    else{
      showerrormg(response!.message!);
    }
  }
  }
  void showsucessmsg (String msg){
    MotionToast.success(description: Text(msg),
    position: MotionToastPosition.top,).show(context);
  }
  void showerrormg (String msg){
    MotionToast.error(description: Text(msg),
    position: MotionToastPosition.top,).show(context);
  }
}