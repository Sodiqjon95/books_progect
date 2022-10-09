import 'package:bloc/bloc.dart';
import 'package:books_progect/data/models/helper/helper_model.dart';
import 'package:books_progect/data/repositories/publishers_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'publishers_state.dart';

class PublishersCubit extends Cubit<PublishersState> {
  PublishersCubit({required this.publisherRepository})
      : super(const PublishersState(
          errorText: '',
          formzStatus: FormzStatus.pure,
          publishers: [],
        ));

  final PublisherRepository publisherRepository;

  void getAllPublisher() async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var publishers = await publisherRepository.getAllPublisher();
      emit(
        state.copyWith(
          formzStatus: FormzStatus.submissionSuccess,
          publishers: publishers,
        ),
      );

    } catch (error) {
      emit(state.copyWith(
        formzStatus: FormzStatus.submissionFailure,
        errorText: "get all publisher error",
      ));
    }
  }

  void deletePublisherById(int id) async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var isRemoved = await publisherRepository.deletePublisherById(id: id);
      if (isRemoved) {
        getAllPublisher();
      }
    } catch (error) {
      emit(state.copyWith(
        formzStatus: FormzStatus.submissionFailure,
        errorText: error.toString(),
      ));
    }
  }

  void putPublisher(int id, String name) async {
    emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
    try {
      var putPublisher =
          await publisherRepository.putPublisher(id: id, name: name);
      if (putPublisher.id > 0) {
        getAllPublisher();
      }
    } catch (error) {
      emit(state.copyWith(
          formzStatus: FormzStatus.submissionFailure,
          errorText: "put publisher error"));
    }
  }

void postPublisher(String name)async{
  emit(state.copyWith(formzStatus: FormzStatus.submissionInProgress));
  var postPublisher = await publisherRepository.postPublisher(name: name);
  if(postPublisher.name.isNotEmpty){
    getAllPublisher();

  }
  try {
    
  } catch (e) {
    emit(state.copyWith(formzStatus: FormzStatus.submissionFailure,
    errorText: "post error"));
    
  }


}
}
