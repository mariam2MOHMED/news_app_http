
import 'package:news_app_route/models/sources.dart';

class SourcesResponse {
  String? status;
  List<Sources>? sources;

  SourcesResponse({this.status, this.sources});

 factory SourcesResponse.fromJson(Map<String, dynamic> json) {
return SourcesResponse(    status :json["status"] as String?,
    sources : json["sources"] == null ? null :
    (json["sources"] as List).map((e) =>
        Sources.fromJson(e)).toList());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    if(sources != null) {
      _data["sources"] = sources?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}