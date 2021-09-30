import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_login/animation/fadeAnimation.dart';
import 'package:splash_login/pages/home.dart';
import 'package:splash_login/utils/constant.dart';

class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var showPassword = true;
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      body: Container(
        child: Stack(
          children: [
            // Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('assets/images/wave.png'),
            //     fit: BoxFit.cover
            //   ),
            // ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Padding(
                padding: const EdgeInsets.all(22.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  FadeAnimation(delay: 2, child: Text('Login',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),),
                  SizedBox(height: 20,),
                  FadeAnimation(
                    delay: 2.7,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),
                      child: Column(children: [
                        Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[300]))
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            hintStyle: TextStyle(fontSize: 18,color: Colors.grey)
                          ),
                          style: TextStyle(fontSize: 20,color: Colors.grey[700]),
                        ),
                      ),
                        Container(
                        child: TextField(
                          obscureText: showPassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 18,color: Colors.grey),
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  count++;
                                  if(count % 2 != 0){
                                    showPassword = false;
                                  }else{
                                    showPassword = true;
                                  }
                                });
                              },
                              child: Icon(Icons.remove_red_eye,color: Colors.grey[600],))
                          ),
                          style: TextStyle(fontSize: 20,color: Colors.grey[700]),
                        ),
                      ),
                      ],)
                    ),
                  ),
                  Align(
                    child: FadeAnimation(
                      delay: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, PageTransition(child: Home(), type: PageTransitionType.fade));
                          },
                          // child: ElevatedButton(
                          //   onPressed: (){},
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(13.0),
                          //     child: Text('Login',style: (TextStyle(
                          //       fontSize: 20,
                          //       color: Colors.black
                          //     )),),
                          //   ),
                          //   style: ButtonStyle(
                          //     backgroundColor: MaterialStateProperty.all(oceangreen),
                        
                          //     overlayColor: MaterialStateProperty.all(Colors.orange[300]),
                              
                          //     shape: MaterialStateProperty.all(
                          //       RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(30)
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          child: Container(
                            height: 50,
                            width: 95,
                            child: Align(child: Text('Login',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                              ),
                            )),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              color: oceangreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],),
              ),
            ),
          ],
        ),
      ),
    );}
}