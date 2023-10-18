part of 'services.dart';

class TransactionServices {
  static Future<List<TransactionModel>> getDataTrasanction() async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.gets(
      API.transaction,
      headers: {'Authorization': 'Bearer $token'},
    );
    if (responseBody == null) return [];

    if (responseBody['meta']['code'] == 200) {
      return List<TransactionModel>.from(responseBody['data']['data']
          .map((json) => TransactionModel.fromJson(json))).toList();
    } else {
      throw responseBody['meta']['message'];
    }
  }

  static Future<Map<String, dynamic>> getTotalAmount() async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.gets(
      '${API.transaction}/total',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (responseBody == null) return {};

    if (responseBody['meta']['code'] == 200) {
      return responseBody['data'];
    } else {
      throw responseBody['meta']['message'];
    }
  }

  static Future<TransactionModel> postNewData(TransactionForm value) async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.post(
      API.transaction,
      body: value.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (responseBody == null) throw 'Kosong';
    if (responseBody['meta']['status'] == 'success') {
      var data = responseBody['data'];
      return TransactionModel.fromJson(data);
    }
    throw 'Something went wrong';
  }
}
