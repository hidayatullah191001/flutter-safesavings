part of 'services.dart';

class TransactionServices {
  static Future<Map<String, dynamic>> getDataTrasanction(
      {required String type}) async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.gets(
      type == '' ? API.transaction : '${API.transaction}?type=$type',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (responseBody == null) return {};

    if (responseBody['meta']['code'] == 200) {
      Map<String, dynamic> data = {
        'current_page': responseBody['data']['current_page'],
        'last_page': responseBody['data']['last_page'],
        'transaction': List<TransactionModel>.from(responseBody['data']['data']
            .map((json) => TransactionModel.fromJson(json))).toList()
      };
      return data;
    } else {
      throw responseBody['meta']['message'];
    }
  }

  static Future<Map<String, dynamic>> fetchDataForNextPage(int page,
      {required String type}) async {
    String token = await AppSession.getToken();
    Map? responseBody = await APIRequest.gets(
      type == ''
          ? '${API.transaction}?page=$page'
          : '${API.transaction}?type=$type&page=$page',
      headers: {'Authorization': 'Bearer $token'},
    );
    if (responseBody == null) return {};

    if (responseBody['meta']['code'] == 200) {
      var data = {
        'current_page': responseBody['data']['current_page'],
        'last_page': responseBody['data']['last_page'],
        'transaction': List<TransactionModel>.from(responseBody['data']['data']
            .map((json) => TransactionModel.fromJson(json))).toList()
      };
      return data;
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

  static Future<Map<String, dynamic>> postNewData(TransactionForm value) async {
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
      return data;
    }
    throw 'Something went wrong';
  }
}
