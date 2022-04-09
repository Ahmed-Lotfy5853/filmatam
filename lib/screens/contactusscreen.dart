import 'package:filmatam/customcolor.dart';
import 'package:filmatam/widgets/customappbar.dart';
import 'package:flutter/material.dart';

import '../widgets/customnavigationnbarwidget.dart';
import '../widgets/drawer.dart';
import '../widgets/textformfield.dart';

class ContactusScreen extends StatefulWidget {
  ContactusScreen({Key? key}) : super(key: key);

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  TextEditingController NameController = TextEditingController();

  TextEditingController EmailController = TextEditingController();

  TextEditingController MessageController = TextEditingController();
  late String NameStr;
  late String EmailStr;
  late String MessageStr;

  var ContacusValidationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
              height: 150,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/PNG/Logo_arabic_coloredxx.png'),
                      scale: 100,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.contain
                  )

              ),

            ),*/
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  decoration: BoxDecoration(
                    //trborder: Border.all(color: CustomColor.MainColor),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 30.0, // soften the shadow
                        // spreadRadius: 7.0, //extend the shadow
                        // offset: Offset(
                        //   5.0, // Move to right 10  horizontally
                        //   5.0, // Move to bottom 5 Vertically
                        // ), // changes position of shadow
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Form(
                    key: ContacusValidationKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'كن على تواصل معنا',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        CustomizedTextFormField(
                          Keyboard: TextInputType.name,
                          Controller: NameController,
                          Hint: 'الاسم',
                          PIcon: Icons.person,
                          Validation: (value) {
                            if (value!.isEmpty) {
                              return 'حقل الاسم فارغاً';
                            }
                            return null;
                          },
                        ),
                        CustomizedTextFormField(
                          Keyboard: TextInputType.emailAddress,
                          Controller: EmailController,
                          Hint: 'البريد الالكتروني',
                          PIcon: Icons.mail,
                          Validation: (value) {
                            if (value!.isEmpty) {
                              return 'حقل البريد فارغاً';
                            }
                            return null;
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: CustomizedTextFormField(
                              Keyboard: TextInputType.multiline,
                              Controller: MessageController,
                              Hint: 'الرساله',
                              min: 4,
                              max: true,
                              PIcon: Icons.message,
                              Validation: (value) {
                                if (value!.isEmpty) {
                                  return 'حقل الرساله فارغاً';
                                }
                                return null;
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: 60,
                    height: 60,
                    child: FloatingActionButton(
                        onPressed: () {
                          if (ContacusValidationKey.currentState!.validate()) {
                            NameStr = NameController.text;
                            EmailStr = EmailController.text;
                            MessageStr = MessageController.text;
                            print(NameStr);
                            print(EmailStr);
                            print(MessageStr);
                          }
                        },
                        elevation: 10,
                        backgroundColor: CustomColor.MainColor,
                        child: Image.asset(
                          'assets/icons/telegram.png',
                          scale: 0.6,
                        ))),
              ],
            )
          ],
        ),
      ),
      /* bottomNavigationBar: CustomNavigationBarWidget(Index:widget.page ,Color:CustomColor.MainColor ,bColor:CustomColor.MainColor.shade50 ,Ontap: (index) {
        setState(() {
          widget.page = index;
        });
      }),*/
    );
  }
}
