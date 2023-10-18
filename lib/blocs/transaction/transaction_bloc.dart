import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safesavings/data/models/forms/transaction_form_model.dart';
import 'package:safesavings/data/models/transaction_model.dart';
import 'package:safesavings/data/services/services.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGetAllData) {
        try {
          emit(TransactionLoading());
          final res = await TransactionServices.getDataTrasanction();
          emit(TransactionSuccess(res));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }

      if (event is TransactionGetTotalAmount) {
        try {
          emit(TransactionLoading());
          final res = await TransactionServices.getTotalAmount();
          emit(TransactionSuccessAmount(res));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }

      if (event is TransactionPostNewData) {
        try {
          emit(TransactionLoading());
          final res = await TransactionServices.postNewData(event.data);
          emit(TransactionSuccess([res]));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
