import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmatam/customcolor.dart';
import 'package:filmatam/widgets/imageslider.dart';
import 'package:flutter/material.dart';

import '../widgets/customappbar.dart';
import '../widgets/drawer.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MemberClass> membersIcon = [
      MemberClass(
        Name: 'أحمد الطارون',
        position: 'مطور صفحات الويب',
        photo: 'assets/members/taron.png',
      ),
      MemberClass(
        Name: 'أحمد عماد الدين',
        position: 'مطور تطبيقات الهواتف المحموله',
        photo: 'assets/members/Emad.png',
      ),
      MemberClass(
        Name: 'عبد الرحمن النحاس',
        position: 'مصمم جرافيك',
        photo: 'assets/members/AE.png',
      ),
      MemberClass(
        Name: 'عبد الرحمن أبو زيد',
        position: 'مهندس برمجيات',
        photo: 'assets/members/abozeid.png',
      ),
      MemberClass(
        Name: 'إيمان أيوب',
        position: 'مهندس ذكاء اصطناعي',
        photo: 'assets/members/enginner.png',
      ),
      MemberClass(
        Name: 'منار أبو كيله',
        position: 'مهندس علوم البيانات',
        photo: 'assets/members/enginner.png',
      ),
      MemberClass(
        Name: 'ندا الشورى',
        position: 'مهندس برمجيات',
        photo: 'assets/members/enginner.png',
      ),
    ];
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'قصتنا',
                style: TextStyle(
                    fontSize: 30,
                    color: CustomColor.MainColor,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 340,
                    child: Text(
                      'شركه ناشئه توفر حلولاً متكامله للمؤسسات الخاصه و العامه ',
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 340,
                    child: Text(
                      'تمكنهم من إنشاء هويه للمؤسسه قادره على المنافسه بقوه في مجالها',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 10, end: 10),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                  ),
                  Text(
                    'متخصصون في مجال',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'الدعايه و التسويق',
                        style: TextStyle(
                            fontSize: 20, color: CustomColor.MainColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'تصميم صفحات الويب',
                        style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: CustomColor.MainColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        'تصميم تطبيقات الهواتف',
                        style: TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: CustomColor.MainColor),
                      ),
                    ),
                    Divider(
                      color: Colors.black26,
                      height: 20,
                      thickness: 1.5,
                      indent: 50,
                      endIndent: 50,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'فريقنا',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: CustomColor.MainColor),
                        ),
                      ],
                    ),
                    CarouselSlider.builder(
                        options: CarouselOptions(
                            initialPage: 0,
                            height: 400,
                            enlargeCenterPage: true,
                            pauseAutoPlayOnTouch: false,
                            autoPlay: true),
                        itemBuilder:
                            (BuildContext context, int index, int realIndex) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(10),
                            // color: CustomColor.SecondaryColor,
                            // color: CustomColor.MainColor,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  membersIcon[index].Name,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: CustomColor.MainColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  membersIcon[index].position,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    membersIcon[index].photo,
                                    //te().test[index],
                                    //posts[postindex].imageurl[index],
                                    // posts[1].imageurl[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: membersIcon
                            .length //tete[0].test.length,//posts[0].imageurl.length,
                        //posts[postindex].imageurl.length
                        // Image.asset(,fit: BoxFit.cover,),
                        // Image.asset(posts[1].imageurl,fit: BoxFit.cover,),
                        // Image.asset(posts[2].imageurl,fit: BoxFit.cover,),
                        // Image.asset(posts[3].imageurl,fit: BoxFit.cover,),
                        // Image.asset(posts[4].imageurl,fit: BoxFit.cover,),
                        // Image.asset(posts[5].imageurl,fit: BoxFit.cover,),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MemberClass {
  final String Name;
  final String position;
  final String photo;

  MemberClass(
      {required this.Name, required this.position, required this.photo});
}
