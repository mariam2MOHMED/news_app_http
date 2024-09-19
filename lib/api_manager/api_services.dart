import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_route/api_manager/api_constants.dart';
import 'package:news_app_route/models/news_response.dart';
import 'package:news_app_route/models/source_response.dart';
class ApiServices{


static Future<SourcesResponse> getSources(String categoryId)async {
  final uri = Uri.https(ApiConstant.baseUrl,
      ApiConstant.sourcesEndpoint,
      {
        'apiKey': ApiConstant.apiKey,
        'category': categoryId
      });
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  return SourcesResponse.fromJson(json);
}
static Future<NewsResponse> getNews(

    {String? sourceId,String? query,int?page,int? pageSize})async{


  final uri=Uri.https(ApiConstant.baseUrl,
      ApiConstant.newsEndPoint,{
        'apiKey': ApiConstant.apiKey,
        'sources': sourceId,
        'q':query,

        'pageSize':pageSize.toString(),
//check
        'pageSize':'10',

        'page':page.toString()
      });
  ///
 final response= await http.get(uri);
final json=jsonDecode(response.body);
return NewsResponse.fromJson(json);
}

}