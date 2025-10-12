import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget{
  const ForgetPassword({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900]!,
              Colors.orange[800]!,
              Colors.orange[400]!
            ]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,          
          children: <Widget>[
            const SizedBox(height: 50,),
            const Padding(padding: EdgeInsets.all(20),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Forget Password", style: TextStyle(color: Colors.white, fontSize: 40),),
                Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18),),
              ],
            ),
            ),

            Expanded(child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget> [
                    const SizedBox(height: 60,),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const[
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
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/reset-password');
                      },
                      child: Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.orange[900],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Send mail",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ),
                        
                  ],),
                
                ),
              ),
            ),            
        ],
        ),
      ),








    );
  }

}