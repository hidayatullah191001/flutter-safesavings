part of 'transaction_bloc.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionGetAllData extends TransactionEvent {}

class TransactionGetTotalAmount extends TransactionEvent {}

class TransactionPostNewData extends TransactionEvent {
  final TransactionForm data;
  const TransactionPostNewData(this.data);

  @override
  List<Object> get props => [data];
}
