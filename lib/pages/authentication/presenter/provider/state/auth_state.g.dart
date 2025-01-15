// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      isLoading: json['isLoading'] as bool? ?? false,
      errorMessage: json['errorMessage'] as String? ?? null,
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'errorMessage': instance.errorMessage,
      'isLoggedIn': instance.isLoggedIn,
    };
