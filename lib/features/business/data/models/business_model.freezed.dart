// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessModel {

@JsonKey(name: 'biz_name') String get businessName;@JsonKey(name: 'bss_location') String get location;@JsonKey(name: 'contct_no') String get contact;
/// Create a copy of BusinessModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessModelCopyWith<BusinessModel> get copyWith => _$BusinessModelCopyWithImpl<BusinessModel>(this as BusinessModel, _$identity);

  /// Serializes this BusinessModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessModel&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.location, location) || other.location == location)&&(identical(other.contact, contact) || other.contact == contact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,businessName,location,contact);

@override
String toString() {
  return 'BusinessModel(businessName: $businessName, location: $location, contact: $contact)';
}


}

/// @nodoc
abstract mixin class $BusinessModelCopyWith<$Res>  {
  factory $BusinessModelCopyWith(BusinessModel value, $Res Function(BusinessModel) _then) = _$BusinessModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'biz_name') String businessName,@JsonKey(name: 'bss_location') String location,@JsonKey(name: 'contct_no') String contact
});




}
/// @nodoc
class _$BusinessModelCopyWithImpl<$Res>
    implements $BusinessModelCopyWith<$Res> {
  _$BusinessModelCopyWithImpl(this._self, this._then);

  final BusinessModel _self;
  final $Res Function(BusinessModel) _then;

/// Create a copy of BusinessModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? businessName = null,Object? location = null,Object? contact = null,}) {
  return _then(_self.copyWith(
businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessModel].
extension BusinessModelPatterns on BusinessModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessModel value)  $default,){
final _that = this;
switch (_that) {
case _BusinessModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessModel value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'biz_name')  String businessName, @JsonKey(name: 'bss_location')  String location, @JsonKey(name: 'contct_no')  String contact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessModel() when $default != null:
return $default(_that.businessName,_that.location,_that.contact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'biz_name')  String businessName, @JsonKey(name: 'bss_location')  String location, @JsonKey(name: 'contct_no')  String contact)  $default,) {final _that = this;
switch (_that) {
case _BusinessModel():
return $default(_that.businessName,_that.location,_that.contact);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'biz_name')  String businessName, @JsonKey(name: 'bss_location')  String location, @JsonKey(name: 'contct_no')  String contact)?  $default,) {final _that = this;
switch (_that) {
case _BusinessModel() when $default != null:
return $default(_that.businessName,_that.location,_that.contact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessModel implements BusinessModel {
  const _BusinessModel({@JsonKey(name: 'biz_name') required this.businessName, @JsonKey(name: 'bss_location') required this.location, @JsonKey(name: 'contct_no') required this.contact});
  factory _BusinessModel.fromJson(Map<String, dynamic> json) => _$BusinessModelFromJson(json);

@override@JsonKey(name: 'biz_name') final  String businessName;
@override@JsonKey(name: 'bss_location') final  String location;
@override@JsonKey(name: 'contct_no') final  String contact;

/// Create a copy of BusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessModelCopyWith<_BusinessModel> get copyWith => __$BusinessModelCopyWithImpl<_BusinessModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessModel&&(identical(other.businessName, businessName) || other.businessName == businessName)&&(identical(other.location, location) || other.location == location)&&(identical(other.contact, contact) || other.contact == contact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,businessName,location,contact);

@override
String toString() {
  return 'BusinessModel(businessName: $businessName, location: $location, contact: $contact)';
}


}

/// @nodoc
abstract mixin class _$BusinessModelCopyWith<$Res> implements $BusinessModelCopyWith<$Res> {
  factory _$BusinessModelCopyWith(_BusinessModel value, $Res Function(_BusinessModel) _then) = __$BusinessModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'biz_name') String businessName,@JsonKey(name: 'bss_location') String location,@JsonKey(name: 'contct_no') String contact
});




}
/// @nodoc
class __$BusinessModelCopyWithImpl<$Res>
    implements _$BusinessModelCopyWith<$Res> {
  __$BusinessModelCopyWithImpl(this._self, this._then);

  final _BusinessModel _self;
  final $Res Function(_BusinessModel) _then;

/// Create a copy of BusinessModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? businessName = null,Object? location = null,Object? contact = null,}) {
  return _then(_BusinessModel(
businessName: null == businessName ? _self.businessName : businessName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
