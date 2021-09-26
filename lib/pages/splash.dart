import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_login/animation/fadeAnimation.dart';
import 'package:splash_login/pages/Login.dart';
import 'package:splash_login/utils/constant.dart';

class Splash extends StatefulWidget {
  const Splash({ Key key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin{

  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
    _scaleAnimation = Tween(
      begin: 1.0,
      end: 0.8
    ).animate(_scaleController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _widthController.forward();
      }
    });
    _widthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600)
    );
    _widthAnimation = Tween(
      begin: 80.0,
      end: 300.0,
    ).animate(_widthController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _positionController.forward();
      }
    });

    _positionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );
    _positionAnimation = Tween(
      begin: 0.0,
      end: 220.0
    ).animate(_positionController)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        setState(() {
          hideIcon = true;
        });
        _scale2Controller.forward();
      }
    });

    _scale2Controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _scale2Animation = Tween(
      begin: 1.0,
      end: 40.0,
    ).animate(_scale2Controller)..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.push(context , PageTransition(
          child: Login(), 
          type: PageTransitionType.fade
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/wave2.png'),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ]
                ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(22.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                FadeAnimation(
                  delay: 3.0 , 
                  child: Text('Welcome',style: TextStyle(
                    fontSize: 41,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ),
                SizedBox(height: 15,),
                FadeAnimation(
                  delay: 3.4 , 
                  child: Text("We promise that you'll have the most \nfuss-free time with us ever",
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.5,
                    color: Colors.white
                  ),),
                ),
                SizedBox(height: 180,),
                FadeAnimation(
                  delay: 3.6,
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context,chid) => Transform.scale(
                      scale: _scaleAnimation.value,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _widthController,
                        builder: (context,child) => Container(
                          width: _widthAnimation.value,
                          height: 80,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: oceangreen.withOpacity(.7)
                          ),
                          child: InkWell(
                            onTap: (){
                              _scaleController.forward();
                            },
                            child: Stack(
                              children: [
                                AnimatedBuilder(
                                  animation: _positionController,
                                  builder: (context,child) => Positioned(
                                    left: _positionAnimation.value,
                                    child: AnimatedBuilder(
                                      animation: _scale2Controller,
                                      builder: (context,child) => Transform.scale(
                                        scale: _scale2Animation.value,
                                      child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                      ),
                                      child: hideIcon == false ? 
                                      Icon(
                                        Icons.arrow_forward_rounded,
                                        size: 30,
                                        color: deepblue
                                      )
                                      :Container()
                                      ),
                                    ),
                                  ),
                                )
                                ),
                              ],
                            ),
                          ),
                          
                        ),
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 20,)
              ],),
            )
          ],
        ),
      ),
    );
  }
}