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

  var ContacusValidationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Container(
              height: 200,
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

            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: CustomColor.MainColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Form(
                    key: ContacusValidationKey,
                    child: Column(
                      children: [
                        Text('كن على تواصل معنا',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                        CustomizedTextFormField(Keyboard: TextInputType.name, Controller: NameController, Hint: 'الاسم', PIcon: Icons.person,Validation: (value) {
                          if (value!.isEmpty) {
                            return 'حقل الاسم فارغاً';
                          }
                          return null;
                        },),
                        CustomizedTextFormField(Keyboard: TextInputType.emailAddress, Controller: EmailController, Hint: 'البريد الالكتروني', PIcon: Icons.mail,Validation: (value) {
                          if (value!.isEmpty) {
                            return 'حقل البريد فارغاً';
                          }
                          return null;
                        },),
                        CustomizedTextFormField(Keyboard: TextInputType.multiline, Controller: MessageController, Hint: 'الرساله', PIcon: Icons.message,Validation: (value) {
                          if (value!.isEmpty) {
                            return 'حقل الرساله فارغاً';
                          }
                          return null;
                        },),


                      ],
                    ),
                  ),
                ),
                Container(
                    width: 60,
                    height: 60,
                    child: FloatingActionButton(onPressed: (){},backgroundColor: CustomColor.MainColor,child: Image.asset('assets/icons/telegram.png',scale: 12),)),
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
