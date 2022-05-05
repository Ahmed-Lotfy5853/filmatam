import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/screens/loginscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import '../widgets/textformfield.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController NameController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController PasswordController = TextEditingController();
  var SignupValidationKey = GlobalKey<FormState>();

  late String NameStr;
  late String EmailStr;
  late String PasswordStr;
  Future<void> setSignup() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("NameStr", NameStr);
    await prefs.setString("EmailStr", EmailStr);
    await prefs.setString("PasswordStr", PasswordStr);
  }
  Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("NameStr")??'';
  }
  Future<String> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("EmailStr")??'';
  }
  Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("PasswordStr")??'';
  }
  @override
  initState()  {


    getName().then((value) => NameController.text = value).catchError((e)=>print(e)) ;
    getEmail().then((value) => EmailController.text = value).catchError((e)=>print(e)) ;
    getPassword().then((value) => PasswordController.text = value).catchError((e)=>print(e)) ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Form(
            key: SignupValidationKey,

            child: ListView(
              children: [
                SvgPicture.asset('assets/SVG/Logo_arabic_coloredxx_cleaned.svg'
                  ,width: 200,height:180,
                  //  color: CustomColor.MainColor,
                ),
                Center(
                  child: Text(
                    'إنشاء حساب',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
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
                      },
                    ),
                    CustomizedTextFormField(
                      Hint: 'البريد الالكتروني',
                      Controller: EmailController,
                      PIcon: Icons.mail,
                      Keyboard: TextInputType.emailAddress,
                      Validation: (value) {
                        if (value!.isEmpty) {
                          return 'حقل البريد فارغاً';
                        }else if (!(value!.contains('@') &&
                            value!.contains('.com'))) {
                          return 'البريد غير صالح';
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
                        }else if (value!.length < 8) {
                          return 'كلمه المرور لا تقل عن 8 أحرف';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () async{
                      if (SignupValidationKey.currentState!.validate()) {
                        NameStr = NameController.text;
                        EmailStr = EmailController.text;
                        PasswordStr = PasswordController.text;
                        print(NameStr);
                        print(EmailStr);
                        print(PasswordStr);
                        Map<String,String> data = {
                          "name":NameStr,
                          "email":EmailStr,
                          "password":PasswordStr,
                        };
                        print(data);
                        connectApi.init();
                        connectApi().postData(url: REGISTER, data: data).then((value) async {
                          print(value);
                          token = value.data['message'];
                          await setSignup();
                          Fluttertoast.showToast(
                              msg: 'راجع بريدك لتفعيل الحساب',
                              backgroundColor: CustomColor.MainColor);
                          return Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: Duration(seconds: 2),
                              curve: Curves.easeInOutExpo,
                              type: PageTransitionType.fade,
                              child: LoginScreen(),
                            ),
                          );
                        }).catchError((e)=>Fluttertoast.showToast(
                            msg: 'فشل تسجيل البيانات يرجى اعاده المحاوله',
                            backgroundColor: CustomColor.MainColor,
                            textColor: Colors.white));
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
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'أو قم بإنشاء حساب باستخدام المنصات الاجتماعيه',
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
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
                ),



              ],
            ),
          ),
          curve(context),
        ],
      ),
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
    path.lineTo(0, 0.2 * h);
    path.quadraticBezierTo(w * 0.5, h * 0.01, w, 0.2 * h);
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

Widget curve(BuildContext context) {
  return ClipPath(
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
              child: Text(
                'هل لديك حساب ؟',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () {Navigator.pushReplacement(
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
                child: Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
  );
}
