// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BusinessState {

 ViewState get viewState; List<BusinessEntity> get businesses; BusinessEntity? get selectedBusiness; String? get query; String? get errorMessage;
/// Create a copy of BusinessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessStateCopyWith<BusinessState> get copyWith => _$BusinessStateCopyWithImpl<BusinessState>(this as BusinessState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessState&&(identical(other.viewState, viewState) || other.viewState == viewState)&&const DeepCollectionEquality().equals(other.businesses, businesses)&&(identical(other.selectedBusiness, selectedBusiness) || other.selectedBusiness == selectedBusiness)&&(identical(other.query, query) || other.query == query)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,viewState,const DeepCollectionEquality().hash(businesses),selectedBusiness,query,errorMessage);

@override
String toString() {
  return 'BusinessState(viewState: $viewState, businesses: $businesses, selectedBusiness: $selectedBusiness, query: $query, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BusinessStateCopyWith<$Res>  {
  factory $BusinessStateCopyWith(BusinessState value, $Res Function(BusinessState) _then) = _$BusinessStateCopyWithImpl;
@useResult
$Res call({
 ViewState viewState, List<BusinessEntity> businesses, BusinessEntity? selectedBusiness, String? query, String? errorMessage
});




}
/// @nodoc
class _$BusinessStateCopyWithImpl<$Res>
    implements $BusinessStateCopyWith<$Res> {
  _$BusinessStateCopyWithImpl(this._self, this._then);

  final BusinessState _self;
  final $Res Function(BusinessState) _then;

/// Create a copy of BusinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewState = null,Object? businesses = null,Object? selectedBusiness = freezed,Object? query = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
viewState: null == viewState ? _self.viewState : viewState // ignore: cast_nullable_to_non_nullable
as ViewState,businesses: null == businesses ? _self.businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<BusinessEntity>,selectedBusiness: freezed == selectedBusiness ? _self.selectedBusiness : selectedBusiness // ignore: cast_nullable_to_non_nullable
as BusinessEntity?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessState].
extension BusinessStatePatterns on BusinessState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessState value)  $default,){
final _that = this;
switch (_that) {
case _BusinessState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessState value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewState viewState,  List<BusinessEntity> businesses,  BusinessEntity? selectedBusiness,  String? query,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessState() when $default != null:
return $default(_that.viewState,_that.businesses,_that.selectedBusiness,_that.query,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewState viewState,  List<BusinessEntity> businesses,  BusinessEntity? selectedBusiness,  String? query,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BusinessState():
return $default(_that.viewState,_that.businesses,_that.selectedBusiness,_that.query,_that.errorMessage);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewState viewState,  List<BusinessEntity> businesses,  BusinessEntity? selectedBusiness,  String? query,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BusinessState() when $default != null:
return $default(_that.viewState,_that.businesses,_that.selectedBusiness,_that.query,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BusinessState implements BusinessState {
  const _BusinessState({this.viewState = ViewState.idle, final  List<BusinessEntity> businesses = const [], this.selectedBusiness, this.query, this.errorMessage}): _businesses = businesses;
  

@override@JsonKey() final  ViewState viewState;
 final  List<BusinessEntity> _businesses;
@override@JsonKey() List<BusinessEntity> get businesses {
  if (_businesses is EqualUnmodifiableListView) return _businesses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_businesses);
}

@override final  BusinessEntity? selectedBusiness;
@override final  String? query;
@override final  String? errorMessage;

/// Create a copy of BusinessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessStateCopyWith<_BusinessState> get copyWith => __$BusinessStateCopyWithImpl<_BusinessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessState&&(identical(other.viewState, viewState) || other.viewState == viewState)&&const DeepCollectionEquality().equals(other._businesses, _businesses)&&(identical(other.selectedBusiness, selectedBusiness) || other.selectedBusiness == selectedBusiness)&&(identical(other.query, query) || other.query == query)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,viewState,const DeepCollectionEquality().hash(_businesses),selectedBusiness,query,errorMessage);

@override
String toString() {
  return 'BusinessState(viewState: $viewState, businesses: $businesses, selectedBusiness: $selectedBusiness, query: $query, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BusinessStateCopyWith<$Res> implements $BusinessStateCopyWith<$Res> {
  factory _$BusinessStateCopyWith(_BusinessState value, $Res Function(_BusinessState) _then) = __$BusinessStateCopyWithImpl;
@override @useResult
$Res call({
 ViewState viewState, List<BusinessEntity> businesses, BusinessEntity? selectedBusiness, String? query, String? errorMessage
});




}
/// @nodoc
class __$BusinessStateCopyWithImpl<$Res>
    implements _$BusinessStateCopyWith<$Res> {
  __$BusinessStateCopyWithImpl(this._self, this._then);

  final _BusinessState _self;
  final $Res Function(_BusinessState) _then;

/// Create a copy of BusinessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewState = null,Object? businesses = null,Object? selectedBusiness = freezed,Object? query = freezed,Object? errorMessage = freezed,}) {
  return _then(_BusinessState(
viewState: null == viewState ? _self.viewState : viewState // ignore: cast_nullable_to_non_nullable
as ViewState,businesses: null == businesses ? _self._businesses : businesses // ignore: cast_nullable_to_non_nullable
as List<BusinessEntity>,selectedBusiness: freezed == selectedBusiness ? _self.selectedBusiness : selectedBusiness // ignore: cast_nullable_to_non_nullable
as BusinessEntity?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
