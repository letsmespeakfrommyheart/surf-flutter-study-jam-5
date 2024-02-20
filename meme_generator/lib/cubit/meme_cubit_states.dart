part of 'meme_cubit.dart';

@freezed
class MemeCubitState with _$MemeCubitState {
  const factory MemeCubitState({
    final String? imageFilePath,
    final String? imageNetworkUrl,
    @Default('') final String memeText,
  }) = _MemeCubitState;
}
