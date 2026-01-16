import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {
  THelperFunctions._();

  /// Returns a Color based on string value
  static Color? getColor(String value) {
    switch (value.toLowerCase()) {
     
      case 'red':
        return Colors.red;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'deep purple':
        return Colors.deepPurple;
      case 'indigo':
        return Colors.indigo;
      case 'blue':
        return Colors.blue;
      case 'light blue':
        return Colors.lightBlue;
      case 'cyan':
        return Colors.cyan;
      case 'teal':
        return Colors.teal;
      case 'green':
        return Colors.green;
      case 'light green':
        return Colors.lightGreen;
      case 'lime':
        return Colors.lime;
      case 'yellow':
        return Colors.yellow;
      case 'amber':
        return Colors.amber;
      case 'orange':
        return Colors.orange;
      case 'deep orange':
        return Colors.deepOrange;
      case 'brown':
        return Colors.brown;
      case 'grey':
      case 'gray':
        return Colors.grey;
      case 'blue grey':
        return Colors.blueGrey;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;

      case 'success':
      case 'completed':
      case 'approved':
        return Colors.green;

      case 'warning':
      case 'pending':
        return Colors.orange;

      case 'error':
      case 'failed':
      case 'cancelled':
        return Colors.red;

      case 'info':
        return Colors.blue;

    
      case 'paid':
        return Colors.green;
      case 'unpaid':
        return Colors.red;
      case 'refunded':
        return Colors.blueGrey;
      case 'discount':
        return Colors.deepOrange;
      case 'price':
        return Colors.indigo;

      default:
       
        if (value.startsWith('#')) {
          return Color(
            int.parse(value.replaceFirst('#', '0xff')),
          );
        }
        return null;
    }
  }
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
  static void showAlert(String title, String message){
    showDialog(
      context: Get.context!,
      builder: (BuildContext context){
        return AlertDialog(actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],);
      }
    );
  }
  static void navigateToScreen(BuildContext context, Widget screen){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_)=> screen),
    );
  }
  static String truncateText(String text, int maxLength){
    if(text.length <= maxLength){
      return text;
    }else{
      return '${text.substring(0,maxLength)}...';
    }
  }
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }
  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }
  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
  static String getFormattedDate(DateTime date, {String format = 'dd MM yyyy'}){
    return DateFormat(format).format(date);
  }
  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i=0; i< widgets.length; i += rowSize){
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
