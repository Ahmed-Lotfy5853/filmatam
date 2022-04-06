import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';


import '../widgets/textformfield.dart';

class SignupScreen extends StatefulWidget {



  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController NameController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  var SignupValidationKey =  GlobalKey<FormState>();

  late String NameStr;
  late String EmailStr;
  late String PasswordStr;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       extendBody: true,

         body:
       SingleChildScrollView(
         child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/PNG/Logo_arabic_coloredxx.png',
                  scale: 50,
                ),
              ),
              Text(
                'إنشاء حساب',
                style: TextStyle(
                    fontSize: 36, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Form(
                key: SignupValidationKey,
                child: Column(
                  children: [
                    CustomizedTextFormField(
                        Hint: 'اسم المستخدم',
                        Controller: NameController,
                        PIcon: Icons.person,
                        Keyboard: TextInputType.emailAddress,
                    Validation: (value) {
                      if (value!.isEmpty) {
                        return 'حقل الاسم فارغاً';
                      }
                      return null;
                    },),
                    CustomizedTextFormField(
                        Hint: 'البريد الالكتروني',
                        Controller: EmailController,
                        PIcon: Icons.mail,
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
                        Hint: 'كلمه المرور',
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
                  if (SignupValidationKey.currentState!.validate()) {
                    NameStr = NameController.text;
                    EmailStr = EmailController.text;
                    PasswordStr = PasswordController.text;
                    print(NameStr);
                    print(EmailStr);
                    print(PasswordStr);
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
                    'إنشاء حساب',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'أو قم بإنشاء حساب باستخدام المنصات الاجتماعيه',
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
              ),
              curve(context),
            ],
          ),
       )
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.moveTo(0, h);
    path.lineTo(0, 0.2*h );
    path.quadraticBezierTo(w * 0.5, h * 0.01 , w, 0.2*h );
    path.lineTo(w, h);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}


Widget curve(BuildContext context){
  return
    ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        width: double.infinity,
        height: 177,
        color: CustomColor.MainColor,


        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text('هل لديك حساب ؟',
                  style: TextStyle(
                      fontSize:30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold

                  ),),
              ),
              InkWell(
                onTap: (){

                  Navigator.pushReplacement(
                              context,
                              PageTransition(
                                duration: Duration(seconds: 2),
                                curve: Curves.easeInOutExpo,
                                type: PageTransitionType.fade,
                                child: LoginScreen(),
                              ),
                            );
                },
                child: Container(
                  child:Text("تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),

                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 8),
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
    );
}