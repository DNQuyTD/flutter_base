// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginBlocState {
  String get emailAddress => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  ErrorObject? get errorObject => throw _privateConstructorUsedError;
  LoginStatus get loginStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginBlocStateCopyWith<LoginBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginBlocStateCopyWith<$Res> {
  factory $LoginBlocStateCopyWith(
          LoginBlocState value, $Res Function(LoginBlocState) then) =
      _$LoginBlocStateCopyWithImpl<$Res, LoginBlocState>;
  @useResult
  $Res call(
      {String emailAddress,
      String password,
      ErrorObject? errorObject,
      LoginStatus loginStatus});
}

/// @nodoc
class _$LoginBlocStateCopyWithImpl<$Res, $Val extends LoginBlocState>
    implements $LoginBlocStateCopyWith<$Res> {
  _$LoginBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? errorObject = freezed,
    Object? loginStatus = null,
  }) {
    return _then(_value.copyWith(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginBlocStateCopyWith<$Res>
    implements $LoginBlocStateCopyWith<$Res> {
  factory _$$_LoginBlocStateCopyWith(
          _$_LoginBlocState value, $Res Function(_$_LoginBlocState) then) =
      __$$_LoginBlocStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String emailAddress,
      String password,
      ErrorObject? errorObject,
      LoginStatus loginStatus});
}

/// @nodoc
class __$$_LoginBlocStateCopyWithImpl<$Res>
    extends _$LoginBlocStateCopyWithImpl<$Res, _$_LoginBlocState>
    implements _$$_LoginBlocStateCopyWith<$Res> {
  __$$_LoginBlocStateCopyWithImpl(
      _$_LoginBlocState _value, $Res Function(_$_LoginBlocState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? password = null,
    Object? errorObject = freezed,
    Object? loginStatus = null,
  }) {
    return _then(_$_LoginBlocState(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      errorObject: freezed == errorObject
          ? _value.errorObject
          : errorObject // ignore: cast_nullable_to_non_nullable
              as ErrorObject?,
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
    ));
  }
}

/// @nodoc

class _$_LoginBlocState implements _LoginBlocState {
  const _$_LoginBlocState(
      {required this.emailAddress,
      required this.password,
      required this.errorObject,
      required this.loginStatus});

  @override
  final String emailAddress;
  @override
  final String password;
  @override
  final ErrorObject? errorObject;
  @override
  final LoginStatus loginStatus;

  @override
  String toString() {
    return 'LoginBlocState(emailAddress: $emailAddress, password: $password, errorObject: $errorObject, loginStatus: $loginStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginBlocState &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.errorObject, errorObject) ||
                other.errorObject == errorObject) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, emailAddress, password, errorObject, loginStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginBlocStateCopyWith<_$_LoginBlocState> get copyWith =>
      __$$_LoginBlocStateCopyWithImpl<_$_LoginBlocState>(this, _$identity);
}

abstract class _LoginBlocState implements LoginBlocState {
  const factory _LoginBlocState(
      {required final String emailAddress,
      required final String password,
      required final ErrorObject? errorObject,
      required final LoginStatus loginStatus}) = _$_LoginBlocState;

  @override
  String get emailAddress;
  @override
  String get password;
  @override
  ErrorObject? get errorObject;
  @override
  LoginStatus get loginStatus;
  @override
  @JsonKey(ignore: true)
  _$$_LoginBlocStateCopyWith<_$_LoginBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
