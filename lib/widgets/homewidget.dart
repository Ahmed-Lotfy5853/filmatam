import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';

import '../models.dart';
import 'imageslider.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemBuilder: (ctx,index)=>Container(
      //height: double.minPositive,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(onPressed: null,iconSize: 30, icon: CircleAvatar(radius:30,backgroundImage: AssetImage('assets/dummy/person.png'))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts[index].Name),
                      Text(posts[index].date),

                    ],
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.all(3),
              //   //padding: EdgeInsets.all(3),
              //   decoration: BoxDecoration(
              //       color: CustomColor.MainColor,
              //       borderRadius: BorderRadius.circular(12)
              //   ),
                // child:
                // IconButton( icon: Icon(Icons.chat,color: Colors.white,), onPressed: () {  },),
              // ),
              Container(
                margin: EdgeInsets.all(3),
                padding: EdgeInsets.all(5),
              //   decoration: BoxDecoration(
              //       color: CustomColor.MainColor,
              //       borderRadius: BorderRadius.circular(12)
              //   ),
                child:
                TextButton( onPressed: () {  }, child: Text("متابعه",
                style: TextStyle(
                    fontSize: 22,
                    color: CustomColor.MainColor
                ),),
                  // style: ButtonStyle(
                  //  // overlayColor: MaterialStateProperty.all(Colors.green),
                  //  ),
                )
              ),

            ],
          ),
          Text(posts[index].description,
          style: TextStyle(
            fontSize: 25,

          ),),

          ///////////////////////////////////////////////
         ImageSlider(postindex: index,),
          // Image.asset(posts[index].imageurl,
          //   fit: BoxFit.cover,),
          ///////////////////////////////////////////////////////
          SizedBox(height: 5,),
          /*Row(
            children: [
              SizedBox(width: 10,),
              Icon(Icons.thumb_up,),
              SizedBox(width: 10,),

              SizedBox(width: 10,),
              Icon(Icons.comment),
              SizedBox(width: 10,),

            ],
          ),*/
          SizedBox(height: 5,),
          Divider(height: double.minPositive,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [IconButton(onPressed: null, icon: Icon(Icons.thumb_up)),
                  Text("${posts[index].likesnumber}"),],
              ),
              Row(
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.comment)),
                  Text("${posts[index].commentsnumber}"),
                ],
              ),
              IconButton(onPressed: null, icon: Icon(Icons.share)),

            ],
          )
        ],
      ),
    ),itemCount: posts.length,);
  }
}
