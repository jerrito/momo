import 'package:flutter/foundation.dart';
import 'package:momo/firebase.dart';
import 'package:momo/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  final SharedPreferences? preferences;
  final firebaseService = FirebaseServices();

  UserProvider({required this.preferences}) {
    var appUserString = preferences?.getString("app_user") ?? '';
    _appUser = appUserString.isNotEmpty ? User.fromString(appUserString) : null;
  }

  User? _appUser;
  User? get appUser => _appUser;

  set appUser(User? a) {
    _appUser = a;
    notifyListeners();

    preferences?.setString(
      "app_user",
      a?.toString() ?? '',
    );
  }

  Future<QueryResult<User>?>? getUser({required String phoneNumber}) async {
    var result = await firebaseService.getUser(phoneNumber: phoneNumber);

    if (result?.status == QueryStatus.Successful && result?.data != null) {
      appUser = result?.data;
    }

    return result;
  }

  Future<QueryResult<User>?>? updateUser({required User user}) async {
    var result = await firebaseService.updateUser(user: user);

    if (result?.status == QueryStatus.Successful) {
      await getUser(phoneNumber: user.number ?? "");
    }

    return result;
  }
}
