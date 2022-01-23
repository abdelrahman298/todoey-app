// import 'package:flutter/material.dart';
// import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:social_app/layout/shop_app/cubit/cubit.dart';
// import 'package:social_app/modules/news_app/web_view/web_view_screen.dart';
// import 'package:social_app/modules/shop_app/login/shop_login_screen.dart';
// import 'package:social_app/shared/cubit/cubit.dart';
// import 'package:social_app/shared/network/local/cache_helper.dart';
// import 'package:social_app/shared/styles/colors.dart';
// import 'package:social_app/shared/styles/icon_broken.dart';
//
// Widget defaultButton({
//   double width = double.infinity,
//   Color background = Colors.blue,
//   bool isUpperCase = true,
//   double radius = 3.0,
//   required Function() function,
//   required String text,
// }) =>
//     Container(
//       width: width,
//       height: 50.0,
//       child: MaterialButton(
//         onPressed: function,
//         child: Text(
//           isUpperCase ? text.toUpperCase() : text,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(
//           radius,
//         ),
//         color: background,
//       ),
//     );
//
// Widget defaultTextButton({
//   String? text,
//   Function()? function,
// }) =>
//     TextButton(
//       child: Text(
//         text!.toUpperCase(),
//       ),
//       onPressed: function,
//     );
//
// PreferredSizeWidget defaultAppBar({
//   required BuildContext context,
//    String? title,
//    List<Widget>? actions,
//
//   }) =>
//     AppBar(
//       leading: IconButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         icon: const Icon(IconBroken.Arrow___Left_2),
//       ),
//       title: Text(title!),
//       titleSpacing: 5.0,
//       actions: actions,
//     );
//
// Widget defaultFormField({
//   required TextEditingController controller,
//   required TextInputType type,
//   Function(String)? onSubmit,
//   Function(String)? onChange,
//   Function()? onTap,
//   bool isPassword = false,
//   required String? Function(String?)? validate,
//   required String label,
//   required IconData prefix,
//   IconData? suffix,
//   Function()? suffixPressed,
//   bool isClickable = true,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: onSubmit,
//       onChanged: onChange,
//       onTap: onTap,
//       validator: validate,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 onPressed: suffixPressed,
//                 icon: Icon(
//                   suffix,
//                 ),
//               )
//             : null,
//         border: const OutlineInputBorder(),
//       ),
//     );
//
// Widget buildTaskItem(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 40.0,
//               child: Text(
//                 '${model['time']}',
//               ),
//             ),
//             const SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model['title']}',
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${model['date']}',
//                     style: const TextStyle(
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               width: 20.0,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateData(
//                   status: 'done',
//                   id: model['id'],
//                 );
//               },
//               icon: const Icon(
//                 Icons.check_box,
//                 color: Colors.green,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context).updateData(
//                   status: 'archive',
//                   id: model['id'],
//                 );
//               },
//               icon: const Icon(
//                 Icons.archive,
//                 color: Colors.black45,
//               ),
//             ),
//           ],
//         ),
//       ),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteData(
//           id: model['id'],
//         );
//       },
//     );
//
// Widget tasksBuilder({required List<Map> tasks, context}) => Conditional.single(
//       conditionBuilder: (BuildContext context) => tasks.length > 0,
//       widgetBuilder: (BuildContext context) => ListView.separated(
//         itemBuilder: (context, index) {
//           return buildTaskItem(tasks[index], context);
//         },
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: tasks.length,
//       ),
//       fallbackBuilder: (BuildContext context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.menu,
//               size: 100.0,
//               color: Colors.grey,
//             ),
//             Text(
//               'No Tasks Yet, Please Add Some Tasks',
//               style: TextStyle(
//                 fontSize: 16.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//       context: (context),
//     );
//
// Widget myDivider() => Padding(
//       padding: const EdgeInsetsDirectional.only(
//         start: 20.0,
//       ),
//       child: Container(
//         width: double.infinity,
//         height: 1.0,
//         color: Colors.grey[300],
//       ),
//     );
//
// Widget buildArticleItem(article, context) => InkWell(
//       onTap: () {
//         navigateTo(
//           context,
//           WebViewScreen(article['url']),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Container(
//               width: 120.0,
//               height: 120.0,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   10.0,
//                 ),
//                 image: DecorationImage(
//                   image: NetworkImage('${article['urlToImage']}'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 20.0,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: Theme.of(context).textTheme.bodyText1,
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: const TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 15.0,
//             ),
//           ],
//         ),
//       ),
//     );
//
// Widget articleBuilder(list, context, {isSearch = false}) => Conditional.single(
//       conditionBuilder: (BuildContext context) => list.length > 0,
//       widgetBuilder: (BuildContext context) => ListView.separated(
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: 10,
//       ),
//       fallbackBuilder: (BuildContext context) => isSearch
//           ? Container()
//           : const Center(child: CircularProgressIndicator()),
//       context: (context),
//     );
//
// void navigateTo(context, widget) => Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//     );
//
// void navigateAndFinish(
//   context,
//   widget,
// ) =>
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => widget,
//       ),
//       (route) {
//         return false;
//       },
//     );
//
// void showToast({
//   required String text,
//   required ToastStates state,
// }) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 3,
//       backgroundColor: chooseColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }
//
// enum ToastStates { SUCCESS, ERROR, WARNING }
//
// Color chooseColor(ToastStates state) {
//   Color color;
//   switch (state) {
//     case ToastStates.SUCCESS:
//       return color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       return color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       return color = Colors.amber;
//       break;
//   }
//   return color;
// }
//
// void signOut(context) {
//   CacheHelper.removeData(key: 'token').then((value) {
//     if (value) {
//       navigateAndFinish(context, ShopLoginScreen());
//     }
//   });
// }
//
// Widget buildListProduct(model, context, {bool isOldPrice = true}) => Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         height: 120.0,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomCenter,
//               children: [
//                 Image(
//                   image: NetworkImage(
//                     model.image,
//                   ),
//                   fit: BoxFit.cover,
//                   height: 120,
//                   width: 120,
//                 ),
//                 if (model.discount != 0 && isOldPrice)
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     color: Colors.red,
//                     child: const Text(
//                       'Discount',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 14.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model.name}',
//                     style: const TextStyle(
//                       fontSize: 14.0,
//                       height: 1.3,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 2,
//                   ),
//                   const Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         '${model.price}',
//                         style: const TextStyle(
//                           color: defaultColor,
//                           fontSize: 14.0,
//                           height: 1.3,
//                         ),
//                       ),
//                       const SizedBox(width: 10.0),
//                       if (model.oldPrice != 0 && isOldPrice)
//                         Text(
//                           '${model.oldPrice}',
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 12.0,
//                             height: 1.3,
//                             decoration: TextDecoration.lineThrough,
//                           ),
//                         ),
//                       const Spacer(),
//                       IconButton(
//                         onPressed: () {
//                           ShopCubit.get(context).changeFavorite(model.id);
//                         },
//                         icon: CircleAvatar(
//                           backgroundColor:
//                               ShopCubit.get(context).favorite[model.id]!
//                                   ? defaultColor
//                                   : Colors.grey,
//                           child: const Icon(
//                             Icons.favorite_border_outlined,
//                             color: Colors.white,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
