import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/mainscreen.dart';
import 'package:filmatam/screens/signupscreen.dart';
import 'package:filmatam/widgets/trytransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:page_transition/page_transition.dart';


import '../widgets/textformfield.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  double height = 225;

  var LoginValidationKey = GlobalKey<FormState>();

  late String EmailStr;

  late String PasswordStr;

  Route _createRoute() {

    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) {


        return SignupScreen();},
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutExpo;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [

            ClipPath(
                 clipper: CustomClipPath(),
              child: AnimatedContainer(
                width: double.infinity,
                height: height,
                color: CustomColor.MainColor,


                duration: Duration(seconds: 2),
                curve: Curves.easeInOutExpo,
                child: Column(

                  children: [
                    SafeArea(
                      child: Text('جديد هنا ؟',
                      style: TextStyle(
                        fontSize:36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                      ),),
                    ),
                      InkWell(
                        onTap: (){
                         /* Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutExpo,
                              type: PageTransitionType.topToBottom,
                              child: SignupScreen(),
                            ),
                          );*/
                          /*Navigator.of(context).pushReplacement(
                            _createRoute()
                          );*/
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutExpo,
                              type: PageTransitionType.fade,
                              child: SignupScreen(),
                            ),
                          );
                          /*setState(() {
                            //height = 300;//double.infinity;
                          });*/
                            },
                        child: Container(
                          child:Text("إنشاء حساب",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w100
                            ),),

                        padding: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2
                          ),
                          borderRadius: BorderRadius.horizontal(left: Radius.elliptical(30, 30),right: Radius.elliptical(30, 30))
                        ),
                    ),
                      ),
                  ],
                ),
              ),
               ),

          Image.asset(
            'assets/PNG/Logo_arabic_coloredxx.png',
            scale: 50,
          ),
          Text(
            'تسجيل الدخول',
            style: TextStyle(
                fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Form(
            key: LoginValidationKey,
            child: Column(
              children: [
                CustomizedTextFormField(
                    Hint: 'البريد الالكتروني',
                    Controller: EmailController,
                    PIcon: Icons.person,
                    Keyboard: TextInputType.emailAddress,
                Validation: (value) {
                  if (value!.isEmpty) {
                    return 'حقل البريد فارغاً';
                  }
                  return null;
                },
                ),
                CustomizedTextFormField(
                    PIcon: Icons.lock,
                    Keyboard: TextInputType.visiblePassword,
                    Hint: 'كلمه السر',
                    Controller: PasswordController,
                    Obsecure: true,
                  Validation: (value) {
                    if (value!.isEmpty) {
                      return 'حقل كلمه المرور فارغاً';
                    }
                    return null;
                  },

                ),
              ],
            ),
          ),
          InkWell(
          onTap: (){
            if (LoginValidationKey.currentState!
                .validate()) {
              EmailStr = EmailController.text;
              PasswordStr = PasswordController.text;
              print(EmailStr);
              print(PasswordStr);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen(page: 2,)));

            }

          },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: CustomColor.MainColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(30, 30),
                      right: Radius.elliptical(30, 30))),
              child: Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'أو قم بتسجيل الدخول باستخدام المنصات الاجتماعيه',
            style: TextStyle(
                fontSize: 19, color: Colors.black, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/icons/linkedin.png',scale: 20,),
                  )
              ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/icons/google.png',scale: 20,),
                  )
              ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/icons/twitter.png',scale: 20,),
                  )
              ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                            decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Image.asset('assets/icons/facebook.png',scale: 20,),
                  )
              ),
            ],
          )
      ],
    ),
        ));
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h * 0.777);
    path.quadraticBezierTo(w * 0.5, h * 0.985, w, h * 0.777);
    path.lineTo(w, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}




