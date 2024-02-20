// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemeCubitState {
  String? get imageFilePath => throw _privateConstructorUsedError;
  String? get imageNetworkUrl => throw _privateConstructorUsedError;
  String get memeText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MemeCubitStateCopyWith<MemeCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemeCubitStateCopyWith<$Res> {
  factory $MemeCubitStateCopyWith(
          MemeCubitState value, $Res Function(MemeCubitState) then) =
      _$MemeCubitStateCopyWithImpl<$Res, MemeCubitState>;
  @useResult
  $Res call({String? imageFilePath, String? imageNetworkUrl, String memeText});
}

/// @nodoc
class _$MemeCubitStateCopyWithImpl<$Res, $Val extends MemeCubitState>
    implements $MemeCubitStateCopyWith<$Res> {
  _$MemeCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFilePath = freezed,
    Object? imageNetworkUrl = freezed,
    Object? memeText = null,
  }) {
    return _then(_value.copyWith(
      imageFilePath: freezed == imageFilePath
          ? _value.imageFilePath
          : imageFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imageNetworkUrl: freezed == imageNetworkUrl
          ? _value.imageNetworkUrl
          : imageNetworkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      memeText: null == memeText
          ? _value.memeText
          : memeText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MemeCubitStateImplCopyWith<$Res>
    implements $MemeCubitStateCopyWith<$Res> {
  factory _$$MemeCubitStateImplCopyWith(_$MemeCubitStateImpl value,
          $Res Function(_$MemeCubitStateImpl) then) =
      __$$MemeCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? imageFilePath, String? imageNetworkUrl, String memeText});
}

/// @nodoc
class __$$MemeCubitStateImplCopyWithImpl<$Res>
    extends _$MemeCubitStateCopyWithImpl<$Res, _$MemeCubitStateImpl>
    implements _$$MemeCubitStateImplCopyWith<$Res> {
  __$$MemeCubitStateImplCopyWithImpl(
      _$MemeCubitStateImpl _value, $Res Function(_$MemeCubitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageFilePath = freezed,
    Object? imageNetworkUrl = freezed,
    Object? memeText = null,
  }) {
    return _then(_$MemeCubitStateImpl(
      imageFilePath: freezed == imageFilePath
          ? _value.imageFilePath
          : imageFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      imageNetworkUrl: freezed == imageNetworkUrl
          ? _value.imageNetworkUrl
          : imageNetworkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      memeText: null == memeText
          ? _value.memeText
          : memeText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MemeCubitStateImpl implements _MemeCubitState {
  const _$MemeCubitStateImpl(
      {this.imageFilePath, this.imageNetworkUrl, this.memeText = ''});

  @override
  final String? imageFilePath;
  @override
  final String? imageNetworkUrl;
  @override
  @JsonKey()
  final String memeText;

  @override
  String toString() {
    return 'MemeCubitState(imageFilePath: $imageFilePath, imageNetworkUrl: $imageNetworkUrl, memeText: $memeText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemeCubitStateImpl &&
            (identical(other.imageFilePath, imageFilePath) ||
                other.imageFilePath == imageFilePath) &&
            (identical(other.imageNetworkUrl, imageNetworkUrl) ||
                other.imageNetworkUrl == imageNetworkUrl) &&
            (identical(other.memeText, memeText) ||
                other.memeText == memeText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, imageFilePath, imageNetworkUrl, memeText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MemeCubitStateImplCopyWith<_$MemeCubitStateImpl> get copyWith =>
      __$$MemeCubitStateImplCopyWithImpl<_$MemeCubitStateImpl>(
          this, _$identity);
}

abstract class _MemeCubitState implements MemeCubitState {
  const factory _MemeCubitState(
      {final String? imageFilePath,
      final String? imageNetworkUrl,
      final String memeText}) = _$MemeCubitStateImpl;

  @override
  String? get imageFilePath;
  @override
  String? get imageNetworkUrl;
  @override
  String get memeText;
  @override
  @JsonKey(ignore: true)
  _$$MemeCubitStateImplCopyWith<_$MemeCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
