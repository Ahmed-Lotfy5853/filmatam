import 'package:filmatam/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:like_button/like_button.dart';

import '../customcolor.dart';
import 'imageslider.dart';


class PostItem extends StatefulWidget {
          String name;
          String photo;
          String description;
          // List<String> photos;
          String photos;
          String date;
          int likes;
          int comments;
          int index;
          bool  liked = false;
          bool  followed = false;
          bool  visible = true;
          bool  commentsshow = false;
          bool comment_visible = false;
          List comment;
          TextEditingController CommentController = TextEditingController();


          PostItem(
              {
                required  this.name,
                required  this.photo,
                required  this.description,
                required  this.photos,
                required  this.date,
                required  this.likes,
                required  this.comments,
                required  this.index,
                required  this.comment,

              });


  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem>with SingleTickerProviderStateMixin {

  late Widget child;
  late bool expand;
  late AnimationController expandController;
  late Animation<double> animation;

  double animatedheight = 0.0;

  var CommentKey= GlobalKey<FormState>();

  late String CommentStr;
  bool CommentReact = false;

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
    if(widget.commentsshow) {
      expandController.forward();
    }
    else {
      expandController.reverse();
    }
  }
  @override
  void initState() {
    prepareAnimations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: double.minPositive,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: null,
                iconSize: 30,
                icon: CircleAvatar(
                  radius: 30,
                  backgroundImage:
                  AssetImage(widget.photo),),
                splashColor: Colors.transparent,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name),
                      Text(widget.date,
                      textDirection: TextDirection.ltr,),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  //   decoration: BoxDecoration(
                  //       color: CustomColor.MainColor,
                  //       borderRadius: BorderRadius.circular(12)
                  //   ),
                  child: TextButton(

                    onPressed: () {
                      setState(() {
                        widget.followed = !widget.followed;
                      });
                    },
                    child: Text(
                      widget.followed ? "متابع" : "متابعه",
                      style: TextStyle(
                          fontSize: 22, color: CustomColor.MainColor),
                    ),

                    // style: ButtonStyle(
                    //  // overlayColor: MaterialStateProperty.all(Colors.green),
                    //  ),
                  )
              ),
            ],
          ),

          InkWell(
            onTap: () {
              setState(() {
                widget.visible = !widget.visible;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.description,
                overflow:
                widget.visible ? TextOverflow.ellipsis : TextOverflow.visible,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'bukra',
                ),
              ),
            ),
          ),

          SizedBox(
            height: 5,
          ),

          ///////////////////////////////////////////////
          ImageSlider(
            postindex: widget.index, photos: widget.photos,
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

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Visibility(
          //     visible: true,
          //     child: ))
          //         Expanded(
          //           child: ListView.builder(itemBuilder: (context, index) => Row(
          //             children: [
          //               CircleAvatar(backgroundImage: AssetImage(widget.photo),radius: 20,),
          //               SizedBox(width: 10,),
          //               Expanded(
          //                 child: TextFormField(
          //                   keyboardType: TextInputType.multiline,
          //                   readOnly: true,
          //                   decoration: InputDecoration(
          //
          //                     filled: true,
          //                     fillColor: Colors.grey.shade200,
          //                     enabledBorder: OutlineInputBorder(
          //                       borderSide: BorderSide(color: Colors.transparent),
          //                       borderRadius: BorderRadius.circular(15.0),
          //                     ),
          //                     labelText: widget.description,                                  suffixIcon: Icon(Icons.heart_broken),
          //                   ),
          //                   maxLines:null ,
          //                 ),
          //               ),
          //
          //
          //             ],
          //           )),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  // IconButton(onPressed: () {
                  //   setState(() {
                  //     widget.liked = !widget.liked;
                  //   });
                  // },
                  //   icon: Icon(Icons.thumb_up,
                  //     color: widget.liked ? CustomColor.MainColor : Colors
                  //         .grey,),
                  //   splashColor: Colors.transparent,),
                  LikeButton(
                    likeBuilder: (bool lik ){
                      return SvgPicture.asset('assets/SVG/heartfilled.svg'
                        ,width: 10,height:10,color: lik?CustomColor.MainColor:Colors.grey,
                        
                      );
                    },
                    isLiked: widget.liked,
                    size: 25,
                    // onTap: onlike,
                    likeCount: widget.likes,
                    likeCountPadding: EdgeInsets.only(right: 10),


                    circleColor: CircleColor(start: CustomColor.MainColor, end: CustomColor.MainColor),
                    bubblesColor: BubblesColor(dotSecondaryColor: CustomColor.SecondaryColor, dotPrimaryColor: CustomColor.MainColor),
                  ),
                  // Text("${widget.likes}"),
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
                      onPressed: () {
                        setState(() {
                          animatedheight!=0?animatedheight=0:animatedheight=100;
                          widget.commentsshow = !widget.commentsshow;
                          print(widget.commentsshow);
                          _runExpandCheck();
                        });
                      },
                      icon: Icon(Icons.mode_comment_outlined,color: Colors.black54.withOpacity(0.4),)),
                  Visibility(visible:widget.comments == null ||widget.comments == 0 ? false:true ,child: Text("${widget.comments}",style: TextStyle(color: Colors.grey),)),
                ],
              ),
              IconButton(onPressed: null, icon: Icon(Icons.share)),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(10),

            child: Visibility(
              visible: widget.commentsshow,
              child: Column(
                  children: [
                    Divider(height: 10,),
                    Container(
                      height: 200,
                      child: ListView.builder(itemBuilder: (context, index) {

                        return Row(
                        children: [
                          CircleAvatar(backgroundImage: NetworkImage(widget.comment[index]['user']!['profile']),radius: 20,),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [


                              Container(
                                width: MediaQuery.of(context).size.width*0.78,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                    border: Border.all(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.comment[index]['user']!['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),),
                                    Text(widget.comment[index]['comment'],style: TextStyle(fontSize: 20),softWrap: true,)
                                  ],
                                ),

                              ),
                              Row(children: [
                                InkWell(child: Text('أحببته',style: TextStyle(color: CommentReact ? CustomColor.MainColor:null),),onTap: (){
setState(() {
  CommentReact = !CommentReact;
});
                                },),
                                SizedBox(width: 10,),

                                Text(widget.comment[index]['time_ago'],textDirection: TextDirection.ltr,),
                              ],),
                            ],
                          ),

                        ],
                      );
                      },itemCount: widget.comment.length,),
                    ),
                    Row(
                      children: [
                        CircleAvatar(backgroundImage: AssetImage(widget.photo),radius: 20,),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Form(
                            key: CommentKey,
                            child: TextFormField(
                              controller: widget.CommentController,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(  icon: Icon(Icons.arrow_forward_ios), onPressed: () {
                                    if(CommentKey.currentState!.validate()){
                                      CommentStr = widget.CommentController.text;
                                    }
                                  },),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: 'اكتب تعليقاً..',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.transparent),
                                    borderRadius: BorderRadius.circular(15.0),),

                              ),
                              maxLines: null,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'حقل الاسم فارغاً';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),]),
            ),
          ),
    //       ExpansionPanelList(children: [
    //         ExpansionPanel(headerBuilder: (context,ex)=>Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Row(
    //               children: [
    //                 // IconButton(onPressed: () {
    //                 //   setState(() {
    //                 //     widget.liked = !widget.liked;
    //                 //   });
    //                 // },
    //                 //   icon: Icon(Icons.thumb_up,
    //                 //     color: widget.liked ? CustomColor.MainColor : Colors
    //                 //         .grey,),
    //                 //   splashColor: Colors.transparent,),
    //                 LikeButton(
    //                   likeBuilder: (bool lik ){
    //                     return SvgPicture.asset('assets/SVG/heartfilled.svg'
    //                       ,width: 10,height:10,color: lik?CustomColor.MainColor:Colors.grey,
    //                     );
    //                   },
    //                   isLiked: widget.liked,
    //                   size: 25,
    //                   // onTap: onlike,
    //                   likeCount: widget.likes,
    //
    //                   circleColor: CircleColor(start: CustomColor.MainColor, end: CustomColor.MainColor),
    //                   bubblesColor: BubblesColor(dotSecondaryColor: CustomColor.SecondaryColor, dotPrimaryColor: CustomColor.MainColor),
    //                 ),
    //                 // Text("${widget.likes}"),
    //               ],
    //             ),
    //             Row(
    //               children: [
    //                 /* InkWell(
    //           onTap: null,
    //                 child:
    //                   Image.asset('assets/icons/chat.png',
    //                   scale: 25,),),
    //                   SizedBox(width: 5,),*/
    //                 IconButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         widget.commentsshow = !ex;
    //                       });
    //                     },
    //                     icon: Icon(Icons.mode_comment_outlined,color: Colors.black54.withOpacity(0.4),)),
    //                 Text("${widget.comments}"),
    //               ],
    //             ),
    //             IconButton(onPressed: null, icon: Icon(Icons.share)),
    //           ],
    //         ), body: Container(
    //           padding: EdgeInsets.all(10),
    //           child: Column(
    //               children: [
    //                 Divider(height: 10,),
    //                 Row(
    //                   children: [
    //                     CircleAvatar(backgroundImage: AssetImage(widget.photo),radius: 20,),
    //                     SizedBox(width: 10,),
    //                     Expanded(
    //                       child: TextFormField(
    //                         controller: widget.CommentController,
    //                         keyboardType: TextInputType.multiline,
    //                         decoration: InputDecoration(
    //                             suffixIcon: IconButton(  icon: Icon(Icons.arrow_forward), onPressed: () {  },),
    //                             filled: true,
    //                             fillColor: Colors.grey.shade200,
    //
    //                             enabledBorder: OutlineInputBorder(
    //                               borderSide: BorderSide(color: Colors.transparent),
    //                               borderRadius: BorderRadius.circular(15.0),)
    //
    //                         ),
    //                         validator: (string){
    //
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),]),
    //         ),isExpanded:widget.commentsshow ,)
    //       ],expansionCallback:(ind,exp){
    //         print(exp);
    //         print(ind);
    //
    // },animationDuration: Duration(milliseconds: 100),),
          // if(commentsshow)  Column(
          //   children: [
          //     Expanded(child: Text("Go")),
          //     Divider(
          //       height: 1,
          //     ),
          //     ListTile(
          //       tileColor: Colors.green,
          //       leading: Container(
          //         height: 40.0,
          //         width: 40.0,
          //         decoration: new BoxDecoration(
          //             color: Colors.blue,
          //             borderRadius: new BorderRadius.all(Radius.circular(50))),
          //         child: CircleAvatar(
          //             radius: 50, backgroundImage: AssetImage(Accounts[0].Photo!)),
          //       ),
          //       title: Form(
          //         key: formKey,
          //         child: TextFormField(
          //           maxLines: 4,
          //           minLines: 1,
          //           style: TextStyle(color: Colors.black),
          //           controller: CommentController,
          //           decoration: InputDecoration(
          //             enabledBorder:
          //             // !withBorder
          //                  InputBorder.none,
          //                 // : UnderlineInputBorder(
          //               // borderSide: BorderSide(color: textColor!),
          //             // ),
          //             // focusedBorder: !withBorder
          //             //     ? InputBorder.none
          //             //     : UnderlineInputBorder(
          //             //   borderSide: BorderSide(color: textColor!),
          //             // ),
          //             // border: !withBorder
          //             //     ? InputBorder.none
          //             //     : UnderlineInputBorder(
          //             //   borderSide: BorderSide(color: textColor!),
          //             // ),
          //             labelText: Accounts[0].Name,
          //             // focusColor: textColor,
          //             // fillColor: textColor,
          //             labelStyle: TextStyle(color: CustomColor.MainColor),
          //           ),
          //           validator: (value) => value!.isEmpty ? 'التعليق فارغ' : null,
          //         ),
          //       ),
          //       trailing: GestureDetector(
          //         onTap: (){
          //           setState(() {
          //             commentsshow = !commentsshow;
          //           });
          //         },
          //         child: Icon(Icons.send),
          //       ),
          //     ),
          //   ],
          // ),

          // Column(
          //     children: [
          //       Divider(height: 10,),
          //       Row(
          //         children: [
          //           CircleAvatar(backgroundImage: AssetImage(widget.photo),radius: 20,),
          //           SizedBox(width: 10,),
          //           Expanded(
          //             child: TextFormField(
          //               controller: widget.CommentController,
          //               keyboardType: TextInputType.multiline,
          //               decoration: InputDecoration(
          //                   suffixIcon: IconButton(  icon: Icon(Icons.arrow_forward), onPressed: () {  },),
          //                   filled: true,
          //                   fillColor: Colors.grey.shade200,
          //
          //                   enabledBorder: OutlineInputBorder(
          //                     borderSide: BorderSide(color: Colors.transparent),
          //                     borderRadius: BorderRadius.circular(15.0),)
          //
          //               ),
          //               validator: (string){
          //
          //               },
          //             ),
          //           ),
          //         ],
          //       ),])
         
        ],
      ),
    );
  }
  Future<bool> onlike(bool lik) async {
    setState(() {
      widget.liked=!lik;
    });
    return !lik;
  }
}
