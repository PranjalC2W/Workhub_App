import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_workhub/workhubPage.dart';
import 'package:google_fonts/google_fonts.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override 
  State<LoginPage>createState()=>_LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  final TextEditingController _username=TextEditingController();
  final TextEditingController _password=TextEditingController();

  String enterusername='';
  String pass='';
  String  usernameVal="pranjal123@gmail.com";
  String passVal="Pranjal@123";


@override 
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.black,
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
                children: [
                   Column(children: [
                     Container(
                     padding: const EdgeInsets.all(20),
                       child: Row(
                         children: [
                           Text(
                             "Workhub",
                             style: GoogleFonts.quicksand(
                               fontWeight: FontWeight.w700,
                               fontSize: 28,
                               color: const Color.fromRGBO(255, 255, 255, 1),
                             ),
                           ),
                           const Text(
                             ".",
                             style: TextStyle(
                               fontWeight: FontWeight.w800,
                               fontSize: 35,
                               color: Color.fromRGBO(81, 36, 246, 0.776),
                             ),
                           ),
                         ],
      ),
                     ),
      
                     
                   ]
                
        
        ),
      
        const SizedBox(height: 30,),
        Padding(
      padding:const EdgeInsets.only(left: 20,right: 20,top: 20),
      child: Container(
        alignment: Alignment.center,
        height: 500,
        width: 500,
       decoration:  BoxDecoration(
        color: Colors.black,
         boxShadow: const [
                                  BoxShadow(color: Color.fromRGBO(23, 125, 204, 1),blurRadius: 20)
                                ],
                                borderRadius:BorderRadius.circular(20),
                                border: Border.all(color:const Color.fromRGBO(400, 300, 300, 1.0),
                                
       ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Image.asset("assets/images/login.jpeg",height: 100,width: 100,),
          const SizedBox(height: 50,),
          Container(
            width: 300,
            child: TextFormField(
              maxLength: 20,
              controller: _username,
              style: const TextStyle(color: Colors.yellow),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                iconColor: Colors.white,
               hintText: 'Enter Username',
               hoverColor: Colors.white,
               hintStyle:const  TextStyle(color: Colors.white),
               label: const  Text("Enter valid Username"),
               labelStyle:const  TextStyle(color: Colors.blue),
               border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
               ),
               prefixIcon: const Icon(Icons.person,color:Colors.white,),
              ),
              validator: (value) {
                if(value==null ||value.isEmpty){
                  return 'Please Enter Username';
                }else{
                  return null;
                }
              },
              
            ),
          ),
          const SizedBox(height: 20,),
           Container(
            width: 300,
            child: TextFormField(
              maxLength: 20,
              controller: _password,
              obscureText: true,
              obscuringCharacter: '*',
              style: const TextStyle(color: Colors.yellow),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                iconColor: Colors.white,
                
               hintText: 'Enter Password',
               hoverColor: Colors.white,
               hintStyle:const  TextStyle(color: Colors.white),
               label: const  Text("Enter valid Password"),
               labelStyle:const  TextStyle(color: Colors.blue),
               border: OutlineInputBorder(
                borderRadius:BorderRadius.circular(20),
               ),
               prefixIcon: const Icon(Icons.password_rounded,color:Colors.white,),
                    
              ),
              validator: (value) {
                if(value==null ||value.isEmpty){
                  return 'Please Enter Password';
                }else{
                  return null;
                }
              },
              
            ),
          ),
          const SizedBox(height: 20,),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 142, 158, 247),
                  blurRadius: 10,
                  spreadRadius: 0.7,
                  offset: Offset.infinite,
                ),

              ]
            ),
            child: ElevatedButton(
              onPressed: () {
                enterusername=_username.text;
                pass=_password.text;
                if(enterusername==usernameVal&&pass==passVal){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content:Text("Login Successfully!"),backgroundColor: Colors.green,),
                  
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) {
                      return const WorkhubPage();
                    },)
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content:Text("Login Failed Please Enter valid information!"),backgroundColor: Colors.red,),
                  
                  );
                }
              },
              style:ElevatedButton.styleFrom(
                fixedSize:const  Size(200, 30),
                
              ),
              child: const Text("Login",style: TextStyle(fontSize:20,color: Colors.black),),
            ),
          )
        ],
      ),
        )
        )
        ]
        )
        ),
    )
  );
}
}