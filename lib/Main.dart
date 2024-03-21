import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:Frontpage (),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Frontpage extends StatefulWidget{
  const Frontpage({super.key});
  @override
  State createState()=>_FrontpageState();
 }
 class _FrontpageState extends State{
  @override
   Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
              padding: const EdgeInsets.only(
                top: 33,
                left: 10,
                bottom: 12,
              ),
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
                  //const SizedBox(width:4,),
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
              const SizedBox(height: 100,),
              Container(
                alignment: Alignment.center,
                
                child:Image.asset("assets/images/clean.jpg",
                fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 40,),
              Container(
                alignment: Alignment.center,
                child: Text("We help you to find the work/worker by your need..",
                style:GoogleFonts.bentham(
                  textStyle:const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  )
                )
                ),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>const LoginPage())
                     );
                }, 
                style:ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 10)
                ),
                child:const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started",style: TextStyle(color: Colors.black,fontSize: 20),),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_forward,color: Colors.black,)
                  ],
                ) 
                ),
               
                ])
            
          ),
        );
        
      
    
  }
 }