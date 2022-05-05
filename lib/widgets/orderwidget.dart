import 'package:filmatam/customcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/models.dart';
import '../services/userapi.dart';
import 'orderitem.dart';

class OrderWidget extends StatefulWidget {
  OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {

  TextEditingController RestaurantController = TextEditingController();
  TextEditingController CityController = TextEditingController();

  TextEditingController TableController = TextEditingController();

   List<dynamic> Cities = [];
   List<dynamic> RestaurantsSelected = [];
   late String personsnumber ;
var dropdownvalue;

  var OrderKey = GlobalKey<FormState>();
@override
  void initState() {
  connectApi.init();
  connectApi()
      .getData(url: CITY, query: data, token: token)
      .then((value) async {

    // print(Cities);
    setState(() {
      Cities = value.data;
      // value.data.forEach((e)=>Cities.add(e['name_ar']));
      // person.Name = value.data['name'];
      // person.Name = value.data['name'];
    });
  });

  connectApi()
      .getData(url: RESTAURANTS, query: data, token: token)
      .then((value) async {

    // print(Cities);
    setState(() {
      RestaurantsSelected = value.data;
      // value.data.forEach((e)=>Cities.add(e['name_ar']));
      // person.Name = value.data['name'];
      // person.Name = value.data['name'];
    });
  });


  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double Total = 0;


    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Form(
          key: OrderKey,
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 55),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(2, 2),
                            blurRadius: 10,
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: CityController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'حقل المدينه فارغاً';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: DropdownButton<dynamic>(

                                //value: dropdownvalue,

                                  items: Cities.map((e) {
                                    print(e);
                                    return DropdownMenuItem(
                                        value: e['name_ar'],
                                        child: Text(e['name_ar']));
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      CityController.text = val!;
                                    });
                                  }),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     // SvgPicture.asset(
                              //     //   'assets/SVG/Flag_of_Egypt.svg', width: 30,
                              //     //   height: 30,
                              //     //   // color: Color(0xff0165E1),
                              //     // ),
                              //     // IconButton(onPressed: (){
                              //     //
                              //     // },
                              //     //   icon: Icon(Icons.arrow_downward_sharp,),),
                              //
                              //
                              //   ],
                              // ),
                              hintText: "المدينه"),
                        ),
                        TextFormField(
                          controller: RestaurantController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'حقل المطعم فارغاً';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: DropdownButton<dynamic>(

                                //value: dropdownvalue,

                                  items: RestaurantsSelected.map((e) {
                                    print(e);
                                    return DropdownMenuItem(
                                        value: e['restaurant_name'],
                                        child: Text(e['restaurant_name']));
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      RestaurantController.text = val!;
                                    });
                                  }),
                              // IconButton(
                              //     onPressed: null,
                              //     icon: Icon(Icons.arrow_downward_sharp)),
                              hintText: "المطعم"),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomColor.MainColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: MaterialButton(
                            onPressed: null,
                            child: Center(
                                child: Text(
                              "استخدم موقعي",
                              style: TextStyle(color: CustomColor.MainColor),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                            blurStyle: BlurStyle.outer),
                      ],
                    ),
                    child: TextFormField(
                      controller: TableController,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الحقل  فارغ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "من فضلك أدخل عدد الأفراد ",
                        // helperText: "كمثال طاولة رقم 5",
                        // counterText: "10 أحرف كحد أقصى",
                      ),
                      onFieldSubmitted: (str){
                        setState(() {
                          personsnumber = str;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "طلباتك",
                    style: TextStyle(color: CustomColor.MainColor, fontSize: 22),
                  ),
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Total = Orders[index].sum(MealItemNumber: Orders[index].MealItemNumber,MealItemPrice: Orders[index].MealItemPrice)+Total;
                      if (index == (Orders.length - 1))
                        return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              OrderItem(
                                MealName: Orders[index].MealName,
                                MealSize: Orders[index].MealSize,
                                MealPrice: Orders[index].MealPrice,
                                ImagePhoto: Orders[index].ImagePhoto,
                                FinalMealPrice: Orders[index].FinalMealPrice,
                                BranchName: Orders[index].BranchName,
                                RestaurantName: Orders[index].RestaurantName,
                                MealItemNumber: Orders[index].MealItemNumber,
                                MealItemPrice: Orders[index].MealItemPrice,
                              ),
                              Text(
                                'إجمالي الطلب = ${Total}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      else
                        return OrderItem(
                          MealName: Orders[index].MealName,
                          MealSize: Orders[index].MealSize,
                          MealPrice: Orders[index].MealPrice,
                          ImagePhoto: Orders[index].ImagePhoto,
                          FinalMealPrice: Orders[index].FinalMealPrice,
                          BranchName: Orders[index].BranchName,
                          RestaurantName: Orders[index].RestaurantName,
                          MealItemNumber: Orders[index].MealItemNumber,
                          MealItemPrice: Orders[index].MealItemPrice,
                        );
                    },
                    itemCount: Orders.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      height: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          // color: Colors.blueGrey.shade300,
          color: CustomColor.MainColor,
          child: MaterialButton(
            onPressed: (){
              if(OrderKey.currentState!.validate()){
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text('هل تريد تأكيد الطلب و استكمال الحجز ؟'),
                      content: Row(children: [
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop();
                        },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 2),
                            color: CustomColor.MainColor,
                            child: Text('إلغاء',
                            style: TextStyle(
                              color: Colors.white
                            ),),),),
                        MaterialButton(onPressed: (){
                          Navigator.of(context).pop();
                          Fluttertoast.showToast(
                              msg: 'تم تأكيد الحجز بنجاح',
                              backgroundColor: CustomColor.MainColor);
                        },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 2),
                            color: CustomColor.MainColor,
                            child: Text('تأكيد',
                            style: TextStyle(
                              color: Colors.white
                            ),),),),
                      ],),
                    ));
              }
            },
            child: Text(
              "تأكيد",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
