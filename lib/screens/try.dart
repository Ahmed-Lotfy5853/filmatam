// //@dart=2.9
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
//     );
//
//     return CategoriesTabPage();
//   }
// }
//
// class CategoriesTabPage extends StatefulWidget {
//   @override
//   _CategoriesTabPageState createState() => _CategoriesTabPageState();
// }
//
// class _CategoriesTabPageState extends State<CategoriesTabPage>
//     with SingleTickerProviderStateMixin {
//   TabController tabController;
//   bool showTab = true;
//
//
//
//   @override
//   void initState() {
//     tabController = TabController(
//       length: 2,
//       vsync: this,
//     );
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         showTab
//             ? Container(
//           constraints: BoxConstraints(maxHeight: 150.0),
//           child: Material(
//               color: Colors.blue,
//               child: TabBar(
//                 controller: tabController,
//                 isScrollable: false,
//                 indicatorColor: Color(0xFFFBD30E),
//                 indicatorWeight: 3,
//                 tabs: ,
//               )),
//         )
//             : Container(),
//         Expanded(
//           child: TabBarView(
//
//               controller: tabController,
//               children: ),
//         ),
//       ],
//     );
//   }
// }
//
// class SubCategoryWidget extends StatefulWidget {
//   final List<SubCategory> subCategories;
//
//   SubCategoryWidget({Key key, @required this.subCategories}) : super(key: key);
//
//   @override
//   _SubCategoryWidgetState createState() => _SubCategoryWidgetState();
// }
//
// class _SubCategoryWidgetState extends State<SubCategoryWidget>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       vsync: this,
//       length: widget.subCategories.length,
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double itemWidth = (size.width - 5.0 * 2 - 17) / 3;
//     double itemHeight = itemWidth + 66;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(48.0),
//         child: Container(
//           decoration: BoxDecoration(
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Color(0xFFdddae5),
//                 offset: Offset(0.0, 0.0),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: Container(
//             color: Colors.white,
//             child: TabBar(
//               controller: _tabController,
//               isScrollable: true,
//               unselectedLabelColor: Colors.blue,
//               indicator: BubbleTabIndicator(
//                 indicatorRadius: 9,
//                 indicatorColor: Colors.blue,
//                 padding: EdgeInsets.symmetric(
//                   vertical: 2.0,
//                   horizontal: -2.0,
//                 ),
//               ),
//               tabs: widget.subCategories
//                   .map<Widget>((subCategory) => Tab(text: subCategory.name))
//                   .toList(),
//             ),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: widget.subCategories.map<Widget>((subCategory) {
//           return GridView.count(
//             padding: const EdgeInsets.only(
//               left: 10,
//               top: 10,
//               right: 7,
//               bottom: 0,
//             ),
//             crossAxisCount: 3,
//             mainAxisSpacing: 5.0,
//             crossAxisSpacing: 5.0,
//             childAspectRatio: itemWidth / itemHeight,
//             children: subCategory.products.map((product) {
//               return Padding(
//                 padding: const EdgeInsets.only(top: 10.0, left: 0, right: 0),
//                 child: Column(
//                   children: <Widget>[
//                     Expanded(
//                       child: Container(
//                         child:
//                         //  ProductWidget(item),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(14.0),
//                           child: Image.asset(
//                             product.image,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(14.0),
//                           ),
//                           boxShadow: <BoxShadow>[
//                             BoxShadow(
//                               color: Colors.blue.withOpacity(0.5),
//                               blurRadius: 3.0,
//                             ),
//                           ],
//                         ),
//                         margin: EdgeInsets.all(5.0),
//                         height: size.width / 3,
//                         width: size.width / 3,
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(3.0),
//                       width: size.width / 3,
//                       height: 40,
//                       child: Text(
//                         product.name,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.grey,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
//
// class BubbleTabIndicator extends Decoration {
//   final double indicatorHeight;
//   final Color indicatorColor;
//   final double indicatorRadius;
//   final EdgeInsetsGeometry padding;
//   final EdgeInsetsGeometry insets;
//   final TabBarIndicatorSize tabBarIndicatorSize;
//
//   const BubbleTabIndicator({
//     this.indicatorHeight: 35.0,
//     this.indicatorColor: Colors.greenAccent,
//     this.indicatorRadius: 100.0,
//     this.tabBarIndicatorSize = TabBarIndicatorSize.label,
//     this.padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
//     this.insets: const EdgeInsets.symmetric(horizontal: 5.0),
//   })  : assert(indicatorHeight != null),
//         assert(indicatorColor != null),
//         assert(indicatorRadius != null),
//         assert(padding != null),
//         assert(insets != null);
//
//   @override
//   Decoration lerpFrom(Decoration a, double t) {
//     if (a is BubbleTabIndicator) {
//       return new BubbleTabIndicator(
//         padding: EdgeInsetsGeometry.lerp(a.padding, padding, t),
//         insets: EdgeInsetsGeometry.lerp(a.insets, insets, t),
//       );
//     }
//     return super.lerpFrom(a, t);
//   }
//
//   @override
//   Decoration lerpTo(Decoration b, double t) {
//     if (b is BubbleTabIndicator) {
//       return new BubbleTabIndicator(
//         padding: EdgeInsetsGeometry.lerp(padding, b.padding, t),
//         insets: EdgeInsetsGeometry.lerp(insets, b.insets, t),
//       );
//     }
//     return super.lerpTo(b, t);
//   }
//
//   @override
//   _BubblePainter createBoxPainter([VoidCallback onChanged]) {
//     return new _BubblePainter(this, onChanged);
//   }
// }
//
// class _BubblePainter extends BoxPainter {
//   _BubblePainter(this.decoration, VoidCallback onChanged)
//       : assert(decoration != null),
//         super(onChanged);
//
//   final BubbleTabIndicator decoration;
//
//   double get indicatorHeight => decoration.indicatorHeight;
//   Color get indicatorColor => decoration.indicatorColor;
//   double get indicatorRadius => decoration.indicatorRadius;
//   EdgeInsetsGeometry get padding => decoration.padding;
//   EdgeInsetsGeometry get insets => decoration.insets;
//   TabBarIndicatorSize get tabBarIndicatorSize => decoration.tabBarIndicatorSize;
//
//   Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
//     assert(rect != null);
//     assert(textDirection != null);
//
//     Rect indicator = padding.resolve(textDirection).inflateRect(rect);
//
//     if (tabBarIndicatorSize == TabBarIndicatorSize.tab) {
//       indicator = insets.resolve(textDirection).deflateRect(rect);
//     }
//
//     return new Rect.fromLTWH(
//       indicator.left,
//       indicator.top,
//       indicator.width,
//       indicator.height,
//     );
//   }
//
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     assert(configuration != null);
//     assert(configuration.size != null);
//     final Rect rect = Offset(
//         offset.dx, (configuration.size.height / 2) - indicatorHeight / 2) &
//     Size(configuration.size.width, indicatorHeight);
//     final TextDirection textDirection = configuration.textDirection;
//     final Rect indicator = _indicatorRectFor(rect, textDirection);
//     final Paint paint = Paint();
//     paint.color = indicatorColor;
//     paint.style = PaintingStyle.fill;
//     canvas.drawRRect(
//         RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
//         paint);
//   }
// }
//
// class Category {
//   int id;
//   String name;
//   List<SubCategory> subCategories;
//
//   Category({
//     this.id,
//     this.name,
//     this.subCategories,
//   });
// }
//
// class SubCategory {
//   int id;
//   String name;
//   List<Product> products;
//
//   SubCategory({
//     this.id,
//     this.name,
//     this.products,
//   });
// }
//
// class Product {
//   int id;
//   String name;
//   String image;
//
//   Product({
//     this.id,
//     this.name,
//     this.image,
//   });
// }