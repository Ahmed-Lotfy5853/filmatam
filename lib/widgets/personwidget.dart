import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';

import '../models.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: Colors.red,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                radius: 53,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/dummy/persons/person.png'),
                ),
              ),
              Text(
                Accounts[0].Name,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Divider(
                height: 10,
                color: Colors.grey,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].followers}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'متابٍع',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].following}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'متابَع',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '${Accounts[0].TastedMeals}',
                        style: TextStyle(
                          color: CustomColor.MainColor,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'وجبه مذاقه',
                        style: TextStyle(fontSize: 25, color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
              Divider(
                height: 10,
                color: Colors.grey,
              ),
              TabBar(
                  tabs:[
                    Tab(),
                    Tab(text: 'الاعدادات',),
                  ]
              ),
              TabBarView(children: [
                Container(
                  child: Text('المفضله'),
                ),
                Container(child: Text('الاعدادات'),)
              ])
            ]),
      ),
    );
  }
}
