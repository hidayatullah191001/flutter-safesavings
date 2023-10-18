import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:safesavings/data/models/category_model.dart';
import 'package:safesavings/data/services/services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      if (event is CategoryGetAllData) {
        try {
          emit(CategoryLoading());
          final res = await CategoryServices.getCategoryData();
          emit(CategorySuccess(res));
        } catch (e) {
          emit(CategoryFailed(e.toString()));
        }
      }
    });
  }
}
