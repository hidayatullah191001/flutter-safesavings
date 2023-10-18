import 'package:safesavings/data/models/category_model.dart';

class TransactionModel {
  int? id;
  int? userId;
  int? categoryId;
  String? type;
  String? title;
  String? description;
  int? amount;
  String? transactionDate;
  String? createdAt;
  String? updatedAt;
  CategoryModel? category;

  TransactionModel(
      {this.id,
      this.userId,
      this.categoryId,
      this.type,
      this.title,
      this.description,
      this.amount,
      this.transactionDate,
      this.createdAt,
      this.updatedAt,
      this.category});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    amount = json['amount'];
    transactionDate = json['transaction_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['transaction_date'] = this.transactionDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}
