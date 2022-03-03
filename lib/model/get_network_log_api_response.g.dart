// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_network_log_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNetworkLogApiResponse _$GetNetworkLogApiResponseFromJson(
        Map<String, dynamic> json) =>
    GetNetworkLogApiResponse()
      ..startTime = json['startTime'] as int? ?? 0
      ..endTime = json['endTime'] as int? ?? 0
      ..request = json['request'] == null
          ? null
          : GetNetworkLogApiResponseRequest.fromJson(
              json['request'] as Map<String, dynamic>)
      ..response = json['response'] == null
          ? null
          : GetNetworkLogApiResponseResponse.fromJson(
              json['response'] as Map<String, dynamic>);

Map<String, dynamic> _$GetNetworkLogApiResponseToJson(
        GetNetworkLogApiResponse instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'request': instance.request?.toJson(),
      'response': instance.response?.toJson(),
    };

GetNetworkLogApiResponseRequest _$GetNetworkLogApiResponseRequestFromJson(
        Map<String, dynamic> json) =>
    GetNetworkLogApiResponseRequest()
      ..headers = json['headers'] as String? ?? ''
      ..baseUrl = json['baseUrl'] as String? ?? ''
      ..extra = json['extra'] as String?
      ..method = json['method'] as String? ?? ''
      ..path = json['path'] as String? ?? ''
      ..queryParameters = json['queryParameters'] as String?
      ..responseType = json['responseType'] as String?
      ..data = json['data'] as String?;

Map<String, dynamic> _$GetNetworkLogApiResponseRequestToJson(
        GetNetworkLogApiResponseRequest instance) =>
    <String, dynamic>{
      'headers': instance.headers,
      'baseUrl': instance.baseUrl,
      'extra': instance.extra,
      'method': instance.method,
      'path': instance.path,
      'queryParameters': instance.queryParameters,
      'responseType': instance.responseType,
      'data': instance.data,
    };

GetNetworkLogApiResponseResponse _$GetNetworkLogApiResponseResponseFromJson(
        Map<String, dynamic> json) =>
    GetNetworkLogApiResponseResponse()
      ..data = json['data'] as String?
      ..extra = json['extra'] as String?
      ..headers = json['headers'] as String?
      ..statusCode = json['statusCode'] as int? ?? 0
      ..statusMessage = json['statusMessage'] as String? ?? '';

Map<String, dynamic> _$GetNetworkLogApiResponseResponseToJson(
        GetNetworkLogApiResponseResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'extra': instance.extra,
      'headers': instance.headers,
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
    };
