import 'package:bloc/bloc.dart';
import 'package:books_progect/data/models/helper/helper_model.dart';
import 'package:books_progect/data/repositories/helper_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'helpers_state.dart';

class HelpersCubit extends Cubit<HelpersState> {
  HelpersCubit({required this.helperRepository})
      : super( const HelpersState(
          genres: [],
          errorText: '',
          formzStatus: FormzStatus.pure,
        ));

  final HelperRepository helperRepository;


  void getAllGener() async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var genres = await helperRepository.getGenres();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          genres: genres,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "getAllGenresError",
        ),
      );
    }
  }
}
