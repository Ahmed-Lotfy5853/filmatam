class post {
  final String Name;
  final String description;
  final String date;
  final List<String> imageurl;
  final int likesnumber;
  final int commentsnumber;

  post({
    required this.Name,
    required this.description,
    required this.date,
    required this.imageurl,
    required this.likesnumber,
    required this.commentsnumber,
  });
}

List<post> posts = [
  post(Name: 'محمد محمد',description: 'إنه طعام صحي للغايه', date: '01/01/2021', imageurl: ['assets/dummy/food.png','assets/dummy/food2.png'], likesnumber: 10,commentsnumber: 20,),
  post(Name: 'خالد محمود',description: 'رائع', date: '03/01/2021', imageurl: ['assets/dummy/food2.png'], likesnumber: 30,commentsnumber: 10,),
  post(Name: 'مصطفى أحمد',description: 'شهي', date: '01/06/2021', imageurl: ['assets/dummy/food3.png','assets/dummy/food2.png'], likesnumber: 0,commentsnumber: 5,),
  post(Name: 'المختار محمد',description: 'لا يوجد ما هو أروع من ذلك', date: '02/03/2021', imageurl: ['assets/dummy/food4.png','assets/dummy/food2.png'], likesnumber: 50,commentsnumber: 20,),
  post(Name: 'هادي محمد',description: 'غني بالألوان', date: '021/04/2021', imageurl: ['assets/dummy/food5.png'], likesnumber: 0,commentsnumber: 0,),
  post(Name: 'هادي محمد',description: 'وجبه دسمه', date: '02/05/2021', imageurl: ['assets/dummy/food6.png'], likesnumber: 1,commentsnumber: 0,),
  post(Name: 'فادي محمد',description: 'فاخر', date: '03/06/2021', imageurl: ['assets/dummy/food7.png'], likesnumber: 100,commentsnumber: 150,),
  post(Name: 'مهند مصطفى',description: 'طبق أنيق', date: '01/01/2022', imageurl: ['assets/dummy/food8.png'], likesnumber: 120,commentsnumber: 11,),
  post(Name: 'إياد مصطفى',description: 'صحي للأطفال', date: '02/11/2021', imageurl: ['assets/dummy/food9.png'], likesnumber:20 ,commentsnumber: 300,),
  post(Name: 'مصباح علي',description: 'تناوله لمده ستين يوماً متواصلاً و ستندم بقيه حياتك', date: '11/11/2021', imageurl: ['assets/dummy/food10.png'], likesnumber: 150,commentsnumber: 150,),
  //post(Name: 'محمد محمد', date: '01/01/2021', imageurl: 'assets/dummy/food.png', likesnumber: 116),
  ];
