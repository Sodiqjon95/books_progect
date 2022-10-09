part of 'helpers_cubit.dart';

 class HelpersState extends Equatable {
  const HelpersState({
    required this.genres,
    required this.errorText,
    required this.formzStatus,
  });

  final List<HelperModel> genres;
  final FormzStatus formzStatus;
  final String errorText;

  HelpersState copyWith({
    List<HelperModel>? genres,
    FormzStatus? formzStatus,
    String? errorText,

  }) => HelpersState(
    genres: genres ?? this.genres,
  formzStatus: formzStatus ?? this.formzStatus,
  errorText:  errorText ?? this.errorText,
  );

  @override
  List<Object> get props => [
        genres,
        formzStatus,
        errorText,
      ];
}

