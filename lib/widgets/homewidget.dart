
import 'package:comment_box/comment/comment.dart';
import 'package:filmatam/customcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import 'imageslider.dart';
import 'postitem.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool visible = true;

  bool liked = false;

  bool followed = false;

  TextEditingController CommentController = TextEditingController();

  bool commentsshow =false;


  var formKey = GlobalKey<FormState>();
  List<dynamic>Posts=[];
  List Comments=[];

  @override
  void initState() {
    connectApi.init();
    connectApi()
        .getData(url: POSTS, query: data, token: token)
        .then((value) async {

      // print(Cities);
      setState(() {
        Posts = value.data;
        // value.data.forEach((e)=>Cities.add(e['name_ar']));
        // person.Name = value.data['name'];
        // person.Name = value.data['name'];
      });
    });
    connectApi()
        .getData(url: COMMENTS, query: data, token: token)
        .then((value) async {
setState(() {
  Comments = value.data;
print(Comments);
});
      // print(Cities);

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Posts.isEmpty?LinearProgressIndicator():ListView.builder(
      itemBuilder: (ctx, index) {
        // print(Posts[index]['video'].split());
        return PostItem(photo: Accounts[index].Photo,name:Posts[index]['user']['name'],date: Posts[index]['time_ago'],description: Posts[index]['description'],photos: Posts[index]['video'],likes: Posts[index]['likes'],comments: Posts[index]['comments'],index: index, comment: Comments,);
      },
      itemCount: Posts.length,
    );
  }
}
// Container(
// //height: double.minPositive,
// margin: EdgeInsets.all(10),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.white,
// ),
//
// child: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Row(
// children: [
// IconButton(
// onPressed: null,
// iconSize: 30,
// icon: CircleAvatar(
// radius: 30,
// backgroundImage:
// AssetImage(Accounts[index].Photo),),
// splashColor: Colors.transparent,),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(Accounts[index].Name),
// Text(posts[index].date),
// ],
// ),
// ),
// ),
// // Container(
// //   margin: EdgeInsets.all(3),
// //   //padding: EdgeInsets.all(3),
// //   decoration: BoxDecoration(
// //       color: CustomColor.MainColor,
// //       borderRadius: BorderRadius.circular(12)
// //   ),
// // child:
// // IconButton( icon: Icon(Icons.chat,color: Colors.white,), onPressed: () {  },),
// // ),
// Container(
// margin: EdgeInsets.all(3),
// padding: EdgeInsets.all(5),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20)
// ),
// //   decoration: BoxDecoration(
// //       color: CustomColor.MainColor,
// //       borderRadius: BorderRadius.circular(12)
// //   ),
// child: TextButton(
//
// onPressed: () {
// setState(() {
// followed = !followed;
// });
// },
// child: Text(
// followed ? "متابع" : "متابعه",
// style: TextStyle(
// fontSize: 22, color: CustomColor.MainColor),
// ),
//
// // style: ButtonStyle(
// //  // overlayColor: MaterialStateProperty.all(Colors.green),
// //  ),
// )
// ),
// ],
// ),
//
// InkWell(
// onTap: () {
// setState(() {
// visible = !visible;
// });
// },
// child: Padding(
// padding: const EdgeInsets.all(20.0),
// child: Text(
// posts[index].description,
// overflow:
// visible ? TextOverflow.ellipsis : TextOverflow.visible,
// style: TextStyle(
// fontSize: 22,
// fontFamily: 'bukra',
// ),
// ),
// ),
// ),
//
// SizedBox(
// height: 5,
// ),
//
// ///////////////////////////////////////////////
// ImageSlider(
// postindex: index,
// ),
// // Image.asset(posts[index].imageurl,
// //   fit: BoxFit.cover,),
// ///////////////////////////////////////////////////////
// SizedBox(
// height: 5,
// ),
// /*Row(
//             children: [
//               SizedBox(width: 10,),
//               Icon(Icons.thumb_up,),
//               SizedBox(width: 10,),
//
//               SizedBox(width: 10,),
//               Icon(Icons.comment),
//               SizedBox(width: 10,),
//
//             ],
//           ),*/
// SizedBox(
// height: 5,
// ),
// Divider(
// height: double.minPositive,
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Row(
// children: [
// IconButton(onPressed: () {
// setState(() {
// liked = !liked;
// });
// },
// icon: Icon(Icons.thumb_up,
// color: liked ? CustomColor.MainColor : Colors
//     .grey,),
// splashColor: Colors.transparent,),
// Text("${posts[index].likesnumber}"),
// ],
// ),
// Row(
// children: [
// /* InkWell(
//               onTap: null,
//                     child:
//                       Image.asset('assets/icons/chat.png',
//                       scale: 25,),),
//                       SizedBox(width: 5,),*/
// IconButton(
// onPressed: () {
// setState(() {
// commentsshow = !commentsshow;
// });
// },
// icon: Icon(Icons.mode_comment_outlined,color: Colors.black54.withOpacity(0.4),)),
// Text("${posts[index].commentsnumber}"),
// ],
// ),
// IconButton(onPressed: null, icon: Icon(Icons.share)),
// ],
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Visibility(
// visible: false,
// child: Column(
// children: [
// Divider(height: 10,),
// Row(
// children: [
// CircleAvatar(backgroundImage: AssetImage(Accounts[0].Photo),radius: 20,),
// SizedBox(width: 10,),
// Expanded(
// child: TextFormField(
// controller: CommentController,
// keyboardType: TextInputType.multiline,
// decoration: InputDecoration(
// suffixIcon: IconButton(  icon: Icon(Icons.arrow_forward), onPressed: () {  },),
// filled: true,
// fillColor: Colors.grey.shade200,
//
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.transparent),
// borderRadius: BorderRadius.circular(15.0),)
//
// ),
// validator: (string){
//
// },
// ),
// ),
// ],
// ),
// Expanded(
// child: ListView.builder(itemBuilder: (context, index) => Row(
// children: [
// CircleAvatar(backgroundImage: AssetImage(Accounts[0].Photo),radius: 20,),
// SizedBox(width: 10,),
// Expanded(
// child: TextFormField(
// keyboardType: TextInputType.multiline,
// readOnly: true,
// decoration: InputDecoration(
//
// filled: true,
// fillColor: Colors.grey.shade200,
// enabledBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.transparent),
// borderRadius: BorderRadius.circular(15.0),
// ),
// labelText: posts[index].description,                                  suffixIcon: Icon(Icons.heart_broken),
// ),
// maxLines:null ,
// ),
// ),
//
//
// ],
// )),
// )
// ],
// ),
// ),
// ),
// // if(commentsshow)  Column(
// //   children: [
// //     Expanded(child: Text("Go")),
// //     Divider(
// //       height: 1,
// //     ),
// //     ListTile(
// //       tileColor: Colors.green,
// //       leading: Container(
// //         height: 40.0,
// //         width: 40.0,
// //         decoration: new BoxDecoration(
// //             color: Colors.blue,
// //             borderRadius: new BorderRadius.all(Radius.circular(50))),
// //         child: CircleAvatar(
// //             radius: 50, backgroundImage: AssetImage(Accounts[0].Photo!)),
// //       ),
// //       title: Form(
// //         key: formKey,
// //         child: TextFormField(
// //           maxLines: 4,
// //           minLines: 1,
// //           style: TextStyle(color: Colors.black),
// //           controller: CommentController,
// //           decoration: InputDecoration(
// //             enabledBorder:
// //             // !withBorder
// //                  InputBorder.none,
// //                 // : UnderlineInputBorder(
// //               // borderSide: BorderSide(color: textColor!),
// //             // ),
// //             // focusedBorder: !withBorder
// //             //     ? InputBorder.none
// //             //     : UnderlineInputBorder(
// //             //   borderSide: BorderSide(color: textColor!),
// //             // ),
// //             // border: !withBorder
// //             //     ? InputBorder.none
// //             //     : UnderlineInputBorder(
// //             //   borderSide: BorderSide(color: textColor!),
// //             // ),
// //             labelText: Accounts[0].Name,
// //             // focusColor: textColor,
// //             // fillColor: textColor,
// //             labelStyle: TextStyle(color: CustomColor.MainColor),
// //           ),
// //           validator: (value) => value!.isEmpty ? 'التعليق فارغ' : null,
// //         ),
// //       ),
// //       trailing: GestureDetector(
// //         onTap: (){
// //           setState(() {
// //             commentsshow = !commentsshow;
// //           });
// //         },
// //         child: Icon(Icons.send),
// //       ),
// //     ),
// //   ],
// // ),
// ],
// ),
// )