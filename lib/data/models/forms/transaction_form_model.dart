class TransactionForm {
  final String? categoryId;
  final String? type;
  final String? title;
  final String? description;
  final String? amount;
  final String? transactionDate;

  TransactionForm({
    this.categoryId,
    this.type,
    this.title,
    this.description,
    this.amount,
    this.transactionDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'type': type,
      'title': title,
      'description': description,
      'amount': amount,
      'transaction_date': transactionDate,
    };
  }
}
