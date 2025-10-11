// import 'package:flutter/material.dart';

// void main() {
//   runApp(Home());
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( // <-- এখানে MaterialApp যোগ করো
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [
//                 Colors.orange[900]!,
//                 Colors.orange[800]!,
//                 Colors.orange[400]!,
//               ],
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(height: 50,),
//               Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                        Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
//                        Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18), ),                      
//                   ],),                  
//                   ),

//                   Expanded(child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60),),
//                       ),
//                       child:Padding(padding: EdgeInsets.all(20),
//                       child: Column(
//                         children: <Widget>[
//                           SizedBox(height: 60,),
//                           Container(
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [BoxShadow(
//                                 color: Color.fromRGBO(225, 95, 27, .3),
//                                 blurRadius: 20,
//                                 offset: Offset(0, 10)
//                               )],
//                               //border: Border(bottom: BorderSide(color: Colors.grey[200]!))
//                             ),
//                             child: TextField(
//                               decoration: InputDecoration(hintText: "Email address",
//                               hintStyle: TextStyle(color: Colors.grey),
//                               border: InputBorder.none
//                               ),
//                             ),
//                           ),
                          
//                           Container(
//                             // height: 50,
//                             // margin: EdgeInsets.symmetric(horizontal: 50),
//                             padding: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [BoxShadow(
//                                 color: Color.fromRGBO(225, 95, 27, .3),
//                                 blurRadius: 20,
//                                 offset: Offset(0, 10)
//                               )],
//                             ),
//                             child: TextField(
//                               decoration: InputDecoration(hintText: "Password", 
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: InputBorder.none
//                               ),
                              
//                             ),
//                           ),
//                           SizedBox( height: 40,),
//                           Text("Forget Password", style: TextStyle(color: Colors.grey),),
//                           SizedBox(height: 40,),

//                           Container(
//                             height: 50,
//                             margin: EdgeInsets.symmetric(horizontal: 50),
//                             decoration: BoxDecoration(
//                               color: Colors.orange[900],
//                               borderRadius: BorderRadius.circular(50),                                                          
//                             ),
//                             child: Center(
//                               child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                             ),

//                           ),

//                         ],
//                       ),
//                       ),
//                   ),),          
//             ],            
//           ),

         
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange[900]!,
                Colors.orange[800]!,
                Colors.orange[400]!,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40)),
                    Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Email address",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.orange[900],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
