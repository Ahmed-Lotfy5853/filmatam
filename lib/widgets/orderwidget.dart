import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/models.dart';
import 'orderitem.dart';
import 'restaurantitem.dart';

class OrderWidget extends StatefulWidget {

  OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  TextEditingController RestaurantController = TextEditingController();

  TextEditingController TableController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double Total = 0;

    return Stack(
      alignment: Alignment.bottomCenter,

      children: [
        Container(
          margin: EdgeInsets.only(top:20,bottom: 55),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Container(

                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,

                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer
                        ),
                      ],

                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      TextFormField(

                      controller: RestaurantController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(

                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset('assets/SVG/Flag_of_Egypt.svg'
                                ,width: 30,height:30,
                                // color: Color(0xff0165E1),
                              ),
                              IconButton(onPressed: null,
                                icon: Icon(Icons.arrow_downward_sharp,),),
                            ],
                          ),

                          hintText: "المدينه"
                      ),
                    ),
                    TextFormField(
                      controller: RestaurantController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: null,
                              icon: Icon(Icons.arrow_downward_sharp)),

                          hintText: "المطعم"
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: CustomColor.MainColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MaterialButton(onPressed: null,
                        child: Center(child: Text("استخدم موقعي",
                          style: TextStyle(color: CustomColor.MainColor),)),),
                    ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,

              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: Offset(2, 2),
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer
                ),
              ],

            ),
            child: TextFormField(
              controller: TableController,
              keyboardType: TextInputType.name,


              decoration: InputDecoration(


                labelText: "من فضلك أدخل عدد الأفراد ",
                // helperText: "كمثال طاولة رقم 5",
                // counterText: "10 أحرف كحد أقصى",
              ),
            ),

          ),
                SizedBox(height: 20,),
                Text("طلباتك",
                  style: TextStyle(
                    color: CustomColor.MainColor,
                    fontSize: 22
                  ),
                ),
               ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // Total = Orders[index].sum(MealItemNumber: Orders[index].MealItemNumber,MealItemPrice: Orders[index].MealItemPrice)+Total;
                      Total += Orders[index].MealPrice;
                    if(index == (Orders.length-1))
                    return Container(
                      padding: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          OrderItem(MealName: Orders[index].MealName, MealSize: Orders[index].MealSize, MealPrice: Orders[index].MealPrice, ImagePhoto: Orders[index].ImagePhoto, FinalMealPrice: Orders[index].FinalMealPrice, BranchName: Orders[index].BranchName, RestaurantName: Orders[index].RestaurantName, MealItemNumber: Orders[index].MealItemNumber , MealItemPrice: Orders[index].MealItemPrice,),
                          Text('إجمالي الطلب = ${Total }',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,),),


                          ],
                      ),
                    );
                    else
                    return OrderItem(MealName: Orders[index].MealName, MealSize: Orders[index].MealSize, MealPrice: Orders[index].MealPrice, ImagePhoto: Orders[index].ImagePhoto, FinalMealPrice: Orders[index].FinalMealPrice, BranchName: Orders[index].BranchName, RestaurantName: Orders[index].RestaurantName, MealItemNumber: Orders[index].MealItemNumber , MealItemPrice: Orders[index].MealItemPrice,);
                  },
                  itemCount:Orders.length, separatorBuilder: (BuildContext context, int index) =>SizedBox(height: 10,),
                ),



              ],
    ),
          ),
        ),
    Container(
    width: double.infinity,
    // color: Colors.blueGrey.shade300,
    color: CustomColor.MainColor,
    child:
    MaterialButton(onPressed: null,
    child:
    Text("تأكيد",
    style: TextStyle(
    color: Colors.white
    ),),
    ),),
    ],
    );
  }
}
