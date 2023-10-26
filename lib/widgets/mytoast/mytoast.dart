import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/style.dart';

showtoast(var error) {
  Fluttertoast.showToast(
    msg: '$error',
    toastLength: Toast.LENGTH_SHORT,
    timeInSecForIosWeb: 3,
    backgroundColor: maincolor,
    textColor: white,
    fontSize: 16.0,
  );
}
