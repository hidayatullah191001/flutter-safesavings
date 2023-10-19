part of 'transaction_bloc.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionFailed extends TransactionState {
  final String e;
  const TransactionFailed(this.e);

  @override
  List<Object> get props => [e];
}

class TransactionSuccess extends TransactionState {
  final Map<String, dynamic> data;
  const TransactionSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class TransactionSuccessAmount extends TransactionState {
  final Map<String, dynamic> amount;
  const TransactionSuccessAmount(this.amount);

  @override
  List<Object> get props => [amount];
}
