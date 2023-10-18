part of 'services.dart';

class CategoryServices {
  static Future<List<CategoryModel>> getCategoryData() async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.gets(
      API.category,
      headers: {'Authorization': 'Bearer $token'},
    );
    print(token);

    if (responseBody == null) return [];

    if (responseBody['meta']['code'] == 200) {
      return List<CategoryModel>.from(responseBody['data']['data']
          .map((json) => CategoryModel.fromJson(json))).toList();
    } else {
      throw responseBody['meta']['message'];
    }
  }
}
