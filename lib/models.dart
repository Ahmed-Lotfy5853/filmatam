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
  post(
    Name: 'محمد محمد',
    description: 'إنه طعام صحي للغايه',
    date: '01/01/2021',
    imageurl: ['assets/dummy/posts/food.png', 'assets/dummy/posts/food2.png'],
    likesnumber: 10,
    commentsnumber: 20,
  ),
  post(
    Name: 'خالد محمود',
    description: 'رائع',
    date: '03/01/2021',
    imageurl: ['assets/dummy/posts/food2.png'],
    likesnumber: 30,
    commentsnumber: 10,
  ),
  post(
    Name: 'مصطفى أحمد',
    description: 'شهي',
    date: '01/06/2021',
    imageurl: ['assets/dummy/posts/food3.png', 'assets/dummy/posts/food2.png'],
    likesnumber: 0,
    commentsnumber: 5,
  ),
  post(
    Name: 'المختار محمد',
    description: 'لا يوجد ما هو أروع من ذلك',
    date: '02/03/2021',
    imageurl: ['assets/dummy/posts/food4.png', 'assets/dummy/posts/food2.png'],
    likesnumber: 50,
    commentsnumber: 20,
  ),
  post(
    Name: 'هادي محمد',
    description: 'غني بالألوان',
    date: '021/04/2021',
    imageurl: ['assets/dummy/posts/food5.png'],
    likesnumber: 0,
    commentsnumber: 0,
  ),
  post(
    Name: 'هادي محمد',
    description: 'وجبه دسمه',
    date: '02/05/2021',
    imageurl: ['assets/dummy/posts/food6.png'],
    likesnumber: 1,
    commentsnumber: 0,
  ),
  post(
    Name: 'فادي محمد',
    description: 'فاخر',
    date: '03/06/2021',
    imageurl: ['assets/dummy/posts/food7.png'],
    likesnumber: 100,
    commentsnumber: 150,
  ),
  post(
    Name: 'مهند مصطفى',
    description: 'طبق أنيق',
    date: '01/01/2022',
    imageurl: ['assets/dummy/posts/food8.png'],
    likesnumber: 120,
    commentsnumber: 11,
  ),
  post(
    Name: 'إياد مصطفى',
    description: 'صحي للأطفال',
    date: '02/11/2021',
    imageurl: ['assets/dummy/posts/food9.png'],
    likesnumber: 20,
    commentsnumber: 300,
  ),
  post(
    Name: 'مصباح علي',
    description: 'تناوله لمده ستين يوماً متواصلاً و ستندم بقيه حياتك',
    date: '11/11/2021',
    imageurl: ['assets/dummy/posts/food10.png'],
    likesnumber: 150,
    commentsnumber: 150,
  ),
  //post(Name: 'محمد محمد', date: '01/01/2021', imageurl: 'assets/dummy/food.png', likesnumber: 116),
];

class Restaurant {
  late String Name;
  late String ImageLogo;
  late String RestaurantCategory;
  late String FoodCategory;
  late String priceCategory;
  late Map<String, List<String>> branches;
  double rate = 2.5;

  Restaurant(
      {required this.Name,
      required this.ImageLogo,
      required this.RestaurantCategory,
      required this.FoodCategory,
      required this.priceCategory,
      required this.branches,
      required this.rate});
}

class Meal {
  late String Name;
  late String ImageLogo;
  late String MealCategory;
  double rate = 2.5;
  late double Price;

  Meal(
      {required this.Name,
      required this.ImageLogo,
      required this.MealCategory,
      required this.rate,
      required this.Price});
}

List<Restaurant> Restaurants = [
  Restaurant(
      Name: 'كنتاكي',
      ImageLogo: 'assets/dummy/restaurants/kfc.png',
      RestaurantCategory: 'مطعم فاخر',
      FoodCategory: 'وجبات سريعه',
      priceCategory: 'غالي',
      branches: {
        'القاهره': ['المهندسين', 'الزمالك']
      },
      rate: 4),
  Restaurant(
      Name: 'مؤمن',
      ImageLogo: 'assets/dummy/restaurants/moamen.png',
      RestaurantCategory: 'مطعم متوسط',
      FoodCategory: 'وجبات سريعه',
      priceCategory: 'متوسط',
      branches: {
        'القاهره': ['الجزيره', 'جاردن سيتي'],
        'المنصورة': ['المشايه']
      },
      rate: 4),
  Restaurant(
      Name: 'ماكدونالدز',
      ImageLogo: 'assets/dummy/restaurants/mcdonalds.png',
      RestaurantCategory: 'مطعم سياحي',
      FoodCategory: 'وجبات سريعه',
      priceCategory: 'غالي',
      branches: {
        'القاهره': ['مول مصر'],
        'كفر الشيخ': ['حديقه صنعاء']
      },
      rate: 3.5),
  Restaurant(
      Name: 'البرنس',
      ImageLogo: 'assets/dummy/restaurants/brns.png',
      RestaurantCategory: 'مطعم شعبي',
      FoodCategory: 'مأكولات شعبيه',
      priceCategory: 'منخفض',
      branches: {
        'القاهره': ['مول سيتي ستارز'],
        'كفر الشيخ': ['حديقه صنعاء']
      },
      rate: 3),
  Restaurant(
      Name: 'عزه',
      ImageLogo: 'assets/dummy/restaurants/azza.png',
      RestaurantCategory: 'حلويات',
      FoodCategory: 'حلويات شرقيه و غربيه',
      priceCategory: 'متوسط',
      branches: {
        'الاسكندريه': ['الكورنيش'],
        'كفر الشيخ': ['حديقه صنعاء']
      },
      rate: 3),
  Restaurant(
      Name: 'ٍستار بكس',
      ImageLogo: 'assets/dummy/restaurants/starbucks.png',
      RestaurantCategory: 'كافيه',
      FoodCategory: 'مشروبات',
      priceCategory: 'غالي',
      branches: {
        'القاهره': ['جاردن سيتي'],
        'الاسكندريه': ['الكورنيش']
      },
      rate: 2),
];
List<Meal>  Meals = [
  Meal(Name: 'محشي', ImageLogo: 'assets/dummy/meals/meal1.png', Price: 50, MealCategory: '', rate: 4,),
  Meal(Name: 'بيتزا', ImageLogo: 'assets/dummy/meals/meal2.png', Price: 75, MealCategory: '', rate: 2.9,),
  Meal(Name: 'كشري', ImageLogo: 'assets/dummy/meals/meal3.png', Price: 20, MealCategory: '', rate: 3.5,),
  Meal(Name: 'مكرونه بشاميل', ImageLogo: 'assets/dummy/meals/meal4.png', Price: 68, MealCategory: '', rate: 5,),
  Meal(Name: 'شاورما فراخ', ImageLogo: 'assets/dummy/meals/meal5.png', Price: 35, MealCategory: '', rate: 4.8,),
  Meal(Name: 'ميكس جريل', ImageLogo: 'assets/dummy/meals/meal6.png', Price: 90, MealCategory: '', rate: 1,),
];


class FoodCategory{
  late String Name;
  late String ImageUrl;
  FoodCategory({
    required this.Name,
    required this.ImageUrl
  });
}

List<FoodCategory> FoodCategories = [
  FoodCategory(Name: 'أكلات صحيه', ImageUrl: 'assets/foodcategory/diet.png',),
  FoodCategory(Name: 'أكلات مصريه', ImageUrl: 'assets/foodcategory/flafel.png',),
  FoodCategory(Name: 'أكلات بحريه', ImageUrl: 'assets/foodcategory/crab.png',),
  FoodCategory(Name: 'أكلات مناسبه لمرضى الضغط', ImageUrl: 'assets/foodcategory/healthy.png',),
  FoodCategory(Name: 'فاكهه', ImageUrl: 'assets/foodcategory/fruit.png',),
  FoodCategory(Name: 'أكلات سريعه', ImageUrl: 'assets/foodcategory/hamburger.png',),
];

class Account{
  late String Name;
  late String Photo;
  late String Location;
  late Map<String,Meal> FavoritesMeals;
  late int followers;
  late int following;
  late int TastedMeals;

  Account(
      {required this.Name,
      required this.Photo,
      required this.Location,
      required this.FavoritesMeals,
      required this.followers,
      required this.following,
      required this.TastedMeals});
}

List<Account> Accounts = [
  Account(Name: 'محمد محمد', Photo: 'assets/dummy/persons/person.png', Location: 'المحله الكبرى', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'خالد محمود', Photo: 'assets/dummy/persons/person2.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'مصطفى أحمد', Photo: 'assets/dummy/persons/person3.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'المختار محمد', Photo: 'assets/dummy/persons/person4.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'هادي محمد', Photo: 'assets/dummy/persons/person5.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'فادي محمد', Photo: 'assets/dummy/persons/person6.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'مهند مصطفى', Photo: 'assets/dummy/persons/person6.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'إياد مصطفى', Photo: 'assets/dummy/persons/person6.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'أحمد عماد', Photo: 'assets/dummy/persons/person6.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
  Account(Name: 'مهند لاشين', Photo: 'assets/dummy/persons/person6.png', Location: 'El Mahalla El Kubra', FavoritesMeals: {'محشي':Meals[0],'مكرونه بشاميل':Meals[1]}, followers: 50, following: 5, TastedMeals: 520),
];