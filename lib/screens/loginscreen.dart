import 'dart:convert';

import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/mainscreen.dart';
import 'package:filmatam/screens/signupscreen.dart';
import 'package:filmatam/widgets/trytransition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import '../widgets/textformfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  double height = 225;

  var LoginValidationKey = GlobalKey<FormState>();

  late String EmailStr;

  late String PasswordStr;

   late Widget child;
   late bool expand;
  late AnimationController expandController;
  late Animation<double> animation;
// Obtain shared preferences.

  Future<void> setSign() async {
    final prefs = await SharedPreferences.getInstance();
   await prefs.setString("EmailStr", EmailStr);
    await prefs.setString("PasswordStr", PasswordStr);
  }
   Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
   return await prefs.getString("EmailStr")??'';
  }
  Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("PasswordStr")??'';
  }
  ///Setting up the animation
  void prepareAnimations() {
    expandController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if(expand) {
      expandController.forward();
    }
    else {
      expandController.reverse();
    }
  }
  @override
initState()  {

  _checkIfLoggedIn();
    getEmail().then((value) => EmailController.text = value).catchError((e)=>print(e)) ;
   getPassword().then((value) => PasswordController.text = value).catchError((e)=>print(e)) ;
}
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) {
        return SignupScreen();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutExpo;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  bool isAuth = false;
  /*@override
  void initState() {

    super.initState();
  }*/

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      setState(() {
        isAuth = true;
      });
    }
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
                    child: Text(
                      'جديد هنا ؟',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
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
                      child: Text(
                        "إنشاء حساب",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.elliptical(30, 30),
                              right: Radius.elliptical(30, 30))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/SVG/Logo_arabic_coloredxx_cleaned.svg'
            ,width: 200,height:200,
            //  color: CustomColor.MainColor,
          ),
          // FutureBuilder<dynamic>(
          //   future: UserApi().getAllUsers(),
          //   builder: (context,snapshot){
          //     print(snapshot);
          //     if(snapshot.connectionState == ConnectionState.waiting)
          //       return CircularProgressIndicator();
          //     if(snapshot.hasData){
          //       // print(snapshot.data);
          //       return Center(child: Text(' Data Found'),);  }
          //     else
          //       return  Center(child: Text('No Data Found'),);
          //   },
          // ),
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
            onTap: ()  {
              // setState(() {
              //   _isLoading = true;
              // });
              if (LoginValidationKey.currentState!.validate()) {
                EmailStr = EmailController.text;
                PasswordStr = PasswordController.text;
                // print(EmailStr);
                // print(PasswordStr);
                 data = {
                  'email':EmailStr,
                  'password':PasswordStr,
                  // 'device_name':'android',
                };
                connectApi.init();

                connectApi().postData(url: LOGIN, data: data).then((value) async {
                  token = value.data['access_token'];
                  setSign();
                  Fluttertoast.showToast(
                      msg: 'تسجيل دخول ناجح',
                      backgroundColor: CustomColor.MainColor,
                  textColor: Colors.white);
                  return Navigator.pushReplacement(
                  context,
                  PageTransition(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOutExpo,
                    type: PageTransitionType.fade,
                    child: MainScreen(page: 2,),
                  ),
                );
                }).catchError((e)=>Fluttertoast.showToast(
                    msg: 'فشل تسجيل الدخول يرجى اعاده المحاوله',
                    backgroundColor: CustomColor.MainColor,
                    textColor: Colors.white));
                // connectApi().getData(url: LOGOUT, query: data).then((value) => print('succedded  $value')).catchError((e)=>print(e));

                // var res = await Network().authData(data, '/login');
               // var body = json.decode(res.body);
               //  if(body['success']){
               //    print("success");
               //    // SharedPreferences localStorage = await SharedPreferences.getInstance();
               //    // localStorage.setString('token', json.encode(body['token']));
               //    // localStorage.setString('user', json.encode(body['user']));
               //    Navigator.pushReplacement(
               //        context,
               //        MaterialPageRoute(
               //            builder: (context) => MainScreen(
               //              page: 2,
               //            )));
               //  }else{
               //    print("failed");
               //    _showMsg(body['message']);

                // }

                // setState(() {
                //   _isLoading = false;
                // });


              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: CustomColor.MainColor,
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.elliptical(30, 30),
                      right: Radius.elliptical(30, 30))),
              child: Text(  _isLoading?
                'جاري تسجيل الدخول..':'تسجيل الدخول',
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
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/SVG/in.svg'
                      ,width: 30,height:30,
                        color: Color(0xff0e76a8),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/SVG/g.svg'
                      ,width: 30,height:30,
                      // color: Color(0xff0e76a8),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/SVG/twitter.svg'
                      ,width: 30,height:30,
                      // color: Color(0xff0e76a8),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/SVG/f.svg'
                      ,width: 30,height:30,
                      color: Color(0xff0165E1),
                    ),
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
bool _isLoading = false;
final _scaffoldKey = GlobalKey<ScaffoldState>();
_showMsg(msg) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );
  _scaffoldKey.currentState?.showSnackBar(snackBar);
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
