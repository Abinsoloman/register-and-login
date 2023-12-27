import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:task4/api.dart';

class Loginpaige extends StatefulWidget {
  const Loginpaige({super.key});

  @override
  State<Loginpaige> createState() => _LoginpaigeState();
}

class _LoginpaigeState extends State<Loginpaige> {

  final eml = TextEditingController();
  final psw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: ListView(
        children: [
          Align(alignment: Alignment.topLeft,
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                          child: TextField(
                            controller: eml,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,right: 10,left: 10),
                          child: TextField(
                            controller: psw,
                            decoration: InputDecoration(
                              labelText: "password",
                              border: OutlineInputBorder()
                            ),
                          ),
                        ),
                        ElevatedButton(onPressed: (){
                          fetchposts1();
                        }, child: Text("login"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  fetchposts1()async{
    final Email = eml.text;
    final password = psw.text;
    if(Email.isEmpty){
    showerrormsg1("Email is empty");
    }
    else if(password.isEmpty){
      showerrormsg1("Passsword is empty");
    }
    else{
      final frmdata1 = FormData.fromMap(
        {
          "Email":Email,
          "Password":password
        }
      );
      final Response = await Apiclass().loginUserApi(frmdata1);
      if(Response != null){
        showsucessmsg1(Response.message!);
      }
      else {
        showerrormsg1(Response!.message!);
      }
    }
    
  }
  void showsucessmsg1 (String msg){
  MotionToast.success(description: Text(msg),
  position: MotionToastPosition.bottom,).show(context);
  }
  void showerrormsg1 (String msg){
    MotionToast.error(description: Text(msg),
    position: MotionToastPosition.bottom,).show(context);
  }
}