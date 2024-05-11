// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course_travel/features/destination/domain/entities/destination_entity.dart';
import 'package:course_travel/features/destination/domain/usecases/get_all_destination_usecase.dart';
import 'package:equatable/equatable.dart';

part 'all_destination_event.dart';
part 'all_destination_state.dart';

class AllDestinationBloc extends Bloc<AllDestinationEvent, AllDestinationState> {
  final GetAllDestinationUseCase _useCase;

  AllDestinationBloc(this._useCase) : super(AllDestinationInitial()) {
    on<AllDestinationEvent>((event, emit) async {
      emit(AllDestinationLoading());
      final result = await _useCase();
      result.fold(
        (failure) => emit(AllDestinationFailure(failure.message)),
        (data) => emit(AllDestinationLoaded(data)),
      );
    });
  }
}
