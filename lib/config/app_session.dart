part of 'configs.dart';

class AppSession {
  static Future<bool> saveUserInformation(Map user, String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('email', user['email']);
    await pref.setString('password', user['password']);
    return await pref.setString('token', token);
  }

  static Future<Map<String, dynamic>> getUserInformation() async {
    final pref = await SharedPreferences.getInstance();
    return {
      'email': pref.getString('email'),
      'password': pref.getString('password'),
      'token': pref.getString('token'),
    };
  }

  static Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token').toString();
  }

  static Future<bool> removeUserInformation() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('email');
    pref.remove('password');
    pref.remove('token');
    return true;
  }
}
