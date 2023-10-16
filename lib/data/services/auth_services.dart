part of 'services.dart';

class AuthServices {
  static Future<Map<String, dynamic>> signIn(SignInFormModel value) async {
    Map? responseBody = await APIRequest.post(
      API.login,
      body: value.toJson(),
    );
    if (responseBody == null) return {};
    if (responseBody['meta']['status'] == 'success') {
      var data = responseBody['data'];
      String token = data['access_token'];
      AppSession.saveUserInformation(
          {'email': value.email, 'password': value.password}, token);
      return {
        'user': UserModel.fromJson(data['user']),
        'token': token,
      };
    }
    return {};
  }

  static Future<Map<String, dynamic>> signUp(SignUpFormModel value) async {
    Map? responseBody = await APIRequest.post(
      API.register,
      body: value.toJson(),
    );
    if (responseBody == null) return {};
    if (responseBody['meta']['status'] == 'success') {
      var data = responseBody['data'];
      String token = data['access_token'];
      AppSession.saveUserInformation(
          {'email': value.email, 'password': value.password}, token);
      return {
        'user': UserModel.fromJson(data['user']),
        'token': token,
      };
    }
    return {};
  }

  static Future<SignInFormModel> getCredentiallFromLocal() async {
    try {
      Map<String, dynamic> values = await AppSession.getUserInformation();
      if (values['email'] == null || values['password'] == null) {
        throw 'Please Login!';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> logout() async {
    String token = await AppSession.getToken();

    Map? responseBody = await APIRequest.post(
      API.logout,
      headers: {'authorization': 'Bearer $token'},
    );
    if (responseBody == null) return false;
    if (responseBody['meta']['code'] == 200) {
      return true;
    }
    return false;
  }
}
