// To parse this JSON data, do
//
//     final personResponse = personResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'person_response.freezed.dart';
part 'person_response.g.dart';

List<PersonResponse> personResponseFromJson(String str) => List<PersonResponse>.from(json.decode(str).map((x) => PersonResponse.fromJson(x)));

String personResponseToJson(List<PersonResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@freezed
class PersonResponse with _$PersonResponse {
    const factory PersonResponse({
        required int id,
        required String? firstname,
        required String? lastname,
        required String? email,
        required String? phone,
        required DateTime? birthday,
        required String? gender,
        required Address? address,
        required String? website,
        required String? image,
    }) = _PersonResponse;

    factory PersonResponse.fromJson(Map<String, dynamic> json) => _$PersonResponseFromJson(json);
}

@freezed
class Address with _$Address {
    const factory Address({
        required int id,
        required String? street,
        required String? streetName,
        required String? buildingNumber,
        required String? city,
        required String? zipcode,
        required String? country,

        // ignore: invalid_annotation_target
        @JsonKey(name: 'county_code')
        required String? countyCode,
        required double? latitude,
        required double? longitude,
    }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}



