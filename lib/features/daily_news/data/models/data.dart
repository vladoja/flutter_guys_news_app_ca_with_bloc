import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ResponseData {
  String status;
  int totalResults;
  List<dynamic> articles;
  ResponseData(
      {required this.status,
      required this.totalResults,
      required this.articles});
  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
