import 'package:filmatam/customcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models.dart';
import 'imageslider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool visible = true;

  bool liked =false;

  bool followed = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Container(
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
                IconButton(
                    onPressed: null,
                    iconSize: 30,
                    icon: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/dummy/persons/person.png'),),splashColor: Colors.transparent,),
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
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          followed = !followed;
                        });
                      },
                      child: Text(
                        followed?"متابع":"متابعه",
                        style: TextStyle(
                            fontSize: 22, color: CustomColor.MainColor),
                      ),
                      // style: ButtonStyle(
                      //  // overlayColor: MaterialStateProperty.all(Colors.green),
                      //  ),
                    )),
              ],
            ),

            InkWell(
              onTap: () {
                setState(() {
                  visible = !visible;
                });
              },
              child: Text(
                posts[index].description,
                overflow:
                    visible ? TextOverflow.ellipsis : TextOverflow.visible,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'bukra',
                ),
              ),
            ),

            SizedBox(
              height: 5,
            ),

            ///////////////////////////////////////////////
            ImageSlider(
              postindex: index,
            ),
            // Image.asset(posts[index].imageurl,
            //   fit: BoxFit.cover,),
            ///////////////////////////////////////////////////////
            SizedBox(
              height: 5,
            ),
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
            SizedBox(
              height: 5,
            ),
            Divider(
              height: double.minPositive,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        liked = !liked;
                      });
                    }, icon: Icon(Icons.thumb_up,
                    color: liked?CustomColor.MainColor:Colors.grey,),splashColor: Colors.transparent,),
                    Text("${posts[index].likesnumber}"),
                  ],
                ),
                Row(
                  children: [
                    /* InkWell(
              onTap: null,
                    child:
                      Image.asset('assets/icons/chat.png',
                      scale: 25,),),
                      SizedBox(width: 5,),*/
                    IconButton(
                        onPressed: null,
                        icon: Icon(Icons.mode_comment_outlined)),
                    Text("${posts[index].commentsnumber}"),
                  ],
                ),
                IconButton(onPressed: null, icon: Icon(Icons.share)),
              ],
            )
          ],
        ),
      ),
      itemCount: posts.length,
    );
  }
}
