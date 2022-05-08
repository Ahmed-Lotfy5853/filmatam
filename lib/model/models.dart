//@dart=2.9
import 'package:flutter/foundation.dart';

Map<String, String> data;
String token;

class user {
  final String id;
  String Name;
  String Following;
  String Followers;
  String Tested_meals;
  String Location;
  final String type;
  String email;
  final String mobile;
  final String password;

  user({
    @required this.id,
    @required this.Name,
    @required this.Following,
    @required this.Followers,
    @required this.Tested_meals,
    @required this.Location,
    @required this.type,
    @required this.email,
    @required this.mobile,
    @required this.password,
  });

  factory user.fromJson(Map<String, dynamic> jsonData) {
    return user(
        id: jsonData['id'],
        Name: jsonData['name'],
        Tested_meals: jsonData['tested_meals'],
        Location: jsonData['city'],
        Following: jsonData['following'],
        Followers: jsonData['followers'],
        type: jsonData['type'],
        email: jsonData['email'],
        mobile: jsonData['mobile'],
        password: jsonData['password']);
  }
}

class users {
  final List<dynamic> userList;

  users({this.userList});

  factory users.fromJson(Map<String, dynamic> jsonData) {
    return users(
      userList: jsonData['userList'],
      // user(
      //   id: jsonData['id'],
      //   Name: jsonData['Name'],
      //   type: jsonData['type'],
      //   email: jsonData['email'],
      //   mobile: jsonData['mobile'],
      //   password: jsonData['password']
      // ),
    );
  }
}

class post {
  final String Name;
  final String description;
  final String date;
  final List<String> imageurl;
  final int likesnumber;
  final int commentsnumber;

  post({
    @required this.Name,
    @required this.description,
    @required this.date,
    @required this.imageurl,
    @required this.likesnumber,
    @required this.commentsnumber,
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
  String Name;
  String ImageLogo;
  String restaurantdescription;
  String RestaurantCategory;
  String FoodCategory;
  String priceCategory;
  Map<String, List<String>> branches;
  double rate = 2.5;
  int personreviews = 0;

  Restaurant({
    @required this.Name,
    @required this.ImageLogo,
    @required this.restaurantdescription,
    @required this.RestaurantCategory,
    @required this.FoodCategory,
    @required this.priceCategory,
    @required this.branches,
    @required this.rate,
    @required this.personreviews,
  });
}

class Meal {
  String Name;
  String ImageLogo;
  String MealCategory;
  String rate = '2.5';
  String Price;

  Meal(
      {@required this.Name,
      @required this.ImageLogo,
      @required this.MealCategory,
      @required this.rate,
      @required this.Price});
}

List<dynamic> Restaurants = [];
List<dynamic> Caategory = [];
List<dynamic> Meaals = [];
List<dynamic> Meels = [];
List<dynamic> Plates = [];

class Meel {
  String Name;
  String ImageLogo;
  String rate;
  String price;
  String itemCount;

  Meel(
      {
        @required this.Name,
       this.ImageLogo,
       this.rate,
       this.price,
       this.itemCount});
}

/*List<Restaurant> Restaurants = [
  Restaurant(
      Name: 'كنتاكي',
      ImageLogo: 'assets/dummy/restaurants/kfc.png',
      RestaurantCategory: 'مطعم فاخر',
      FoodCategory: 'وجبات سريعه',
      priceCategory: 'غالي',
      branches: {
        'القاهره': ['المهندسين', 'الزمالك']
      },
      rate: 4,
      personreviews: 300,
      restaurantdescription: 'مطعم لمأكولات الدجاج الشهيره سلسله مطاعم أمريكيه من ولايه كنتاكي'),
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
      rate: 4,
      personreviews: 200,
      restaurantdescription: 'مطعم مصري مشهور بالسندوتشات و الشطائر'),
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
      rate: 3.5,
      personreviews: 100,
      restaurantdescription: 'سلسله عالميه على أرض مصريه تواكب العصر'),
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
      rate: 3,
      personreviews: 20,
      restaurantdescription: 'مطعم مصري أصيل منسوب لصاحبه البرنس'),
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
      rate: 3,
      personreviews: 1000,
      restaurantdescription: 'محل حلويات شهير بالاسكندريه و كفر الشيخ متميز بالايس كريم'),
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
      rate: 2,
      personreviews: 5,
      restaurantdescription: 'كافيه لتقديم القهوه للفئات المجتمعيه الفاخره'),
];*/
List<Meal> Meals = [
  Meal(
    Name: 'محشي',
    ImageLogo: 'assets/dummy/meals/meal1.png',
    Price: '50',
    MealCategory: '',
    rate: '4',
  ),
  Meal(
    Name: 'بيتزا',
    ImageLogo: 'assets/dummy/meals/meal2.png',
    Price: '75',
    MealCategory: '',
    rate: '2.9',
  ),
  Meal(
    Name: 'كشري',
    ImageLogo: 'assets/dummy/meals/meal3.png',
    Price: '20',
    MealCategory: '',
    rate: '3.5',
  ),
  Meal(
    Name: 'مكرونه بشاميل',
    ImageLogo: 'assets/dummy/meals/meal4.png',
    Price: '68',
    MealCategory: '',
    rate: '5',
  ),
  Meal(
    Name: 'شاورما فراخ',
    ImageLogo: 'assets/dummy/meals/meal5.png',
    Price: '35',
    MealCategory: '',
    rate: '4.8',
  ),
  Meal(
    Name: 'ميكس جريل',
    ImageLogo: 'assets/dummy/meals/meal6.png',
    Price: '90',
    MealCategory: '',
    rate: '1',
  ),
];

class FoodCategory {
  String Name;
  String ImageUrl;

  FoodCategory({@required this.Name, @required this.ImageUrl});
}

List<FoodCategory> FoodCategories = [
  FoodCategory(
    Name: 'أكلات صحيه',
    ImageUrl: 'assets/foodcategory/diet.png',
  ),
  FoodCategory(
    Name: 'أكلات مصريه',
    ImageUrl: 'assets/foodcategory/flafel.png',
  ),
  FoodCategory(
    Name: 'أكلات بحريه',
    ImageUrl: 'assets/foodcategory/crab.png',
  ),
  FoodCategory(
    Name: 'أكلات مناسبه لمرضى الضغط',
    ImageUrl: 'assets/foodcategory/healthy.png',
  ),
  FoodCategory(
    Name: 'فاكهه',
    ImageUrl: 'assets/foodcategory/fruit.png',
  ),
  FoodCategory(
    Name: 'أكلات سريعه',
    ImageUrl: 'assets/foodcategory/hamburger.png',
  ),
];

class Account {
  String Name;
  String Photo;
  String Location;
  Map<String, Meal> FavoritesMeals;
  int followers;
  int following;
  int TastedMeals;

  Account(
      {@required this.Name,
      @required this.Photo,
      @required this.Location,
      @required this.FavoritesMeals,
      @required this.followers,
      @required this.following,
      @required this.TastedMeals});
}

List<Account> Accounts = [
  Account(
      Name: 'محمد محمد',
      Photo: 'assets/dummy/persons/person.png',
      Location: 'المحله الكبرى',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'خالد محمود',
      Photo: 'assets/dummy/persons/person2.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'مصطفى أحمد',
      Photo: 'assets/dummy/persons/person3.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'المختار محمد',
      Photo: 'assets/dummy/persons/person4.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'هادي محمد',
      Photo: 'assets/dummy/persons/person5.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'فادي محمد',
      Photo: 'assets/dummy/persons/person6.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'مهند مصطفى',
      Photo: 'assets/dummy/persons/person6.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'إياد مصطفى',
      Photo: 'assets/dummy/persons/person6.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'أحمد عماد',
      Photo: 'assets/dummy/persons/person6.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
  Account(
      Name: 'مهند لاشين',
      Photo: 'assets/dummy/persons/person6.png',
      Location: 'El Mahalla El Kubra',
      FavoritesMeals: {'محشي': Meals[0], 'مكرونه بشاميل': Meals[1]},
      followers: 50,
      following: 5,
      TastedMeals: 520),
];

class Order {
  String ImagePhoto;
  String MealName;
  String MealSize;
  String RestaurantName;
  String BranchName;
  double MealPrice; //= (FinalMealPrice == -1) ? MealItemNumber *
  // MealItemPrice : MealItemNumber * FinalMealPrice;
  double FinalMealPrice;

  double MealItemPrice;

  double MealItemNumber;

//(FinalMealPrice == -1)?MealItemNumber*MealItemPrice:MealItemNumber*FinalMealPrice
  Order({
    @required this.ImagePhoto,
    @required this.MealName,
    @required this.MealSize,
    @required this.RestaurantName,
    @required this.BranchName,
    this.FinalMealPrice = -1,
    @required this.MealItemPrice,
    @required this.MealItemNumber,
  });

  double sum({double MealItemNumber = 0, double MealItemPrice = 0}) {
    return this.MealPrice = MealItemPrice * MealItemNumber;
  }
}

List<Order> Orders = [
  Order(
      MealItemPrice: 50,
      MealSize: 'وسط',
      ImagePhoto: 'assets/dummy/meals/meal1.png',
      BranchName: 'الدقي',
      RestaurantName: 'البرنس',
      MealName: 'محشي',
      MealItemNumber: 2,
      FinalMealPrice: 25),
  Order(
      MealItemPrice: 20,
      MealSize: 'صغير',
      ImagePhoto: 'assets/dummy/meals/fahita.png',
      BranchName: 'الزمالك',
      RestaurantName: 'أبو عمار',
      MealName: 'فاهيتا فراخ',
      MealItemNumber: 8),
  Order(
      MealItemPrice: 80,
      MealSize: 'كبير',
      ImagePhoto: 'assets/dummy/meals/mixgrill.png',
      BranchName: 'الجزيره',
      RestaurantName: 'الدهان',
      MealName: 'ميكس جريل',
      MealItemNumber: 3),
  Order(
      MealItemPrice: 150,
      MealSize: 'عائلي',
      ImagePhoto: 'assets/dummy/meals/km.png',
      BranchName: 'المهندسين',
      RestaurantName: 'كنتاكي',
      MealName: 'دبابيس',
      MealItemNumber: 4),
];
