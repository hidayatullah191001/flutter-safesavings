part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionGetAllData extends TransactionEvent {
  final String type;
  const TransactionGetAllData({required this.type});

  @override
  List<Object> get props => [type];
}

class TransactionGetTotalAmount extends TransactionEvent {}

class TransactionPostNewData extends TransactionEvent {
  final TransactionForm data;
  const TransactionPostNewData(this.data);

  @override
  List<Object> get props => [data];
}

class FetchDataForNextPageEvent extends TransactionEvent {
  final int page;
  final String type;
  const FetchDataForNextPageEvent(this.page, {required this.type});

  @override
  List<Object> get props => [page, type];
}
