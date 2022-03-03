import 'package:json_annotation/json_annotation.dart';
part 'page_model.g.dart';

@JsonSerializable()
class PageModel extends JsonConverter<PageModel, Map<String, dynamic>> {
  @JsonKey(defaultValue: 0)
  late int per;
  @JsonKey(defaultValue: 0)
  late int total;
  @JsonKey(defaultValue: 0)
  late int page;

  @override
  PageModel fromJson(Map<String, dynamic> json) {
    return _$PageModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson(PageModel object) {
    return _$PageModelToJson(object);
  }
}
