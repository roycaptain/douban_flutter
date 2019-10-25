import 'package:dio/dio.dart';
import 'dart:convert';

class RequestManager {
    Dio dio;
    static RequestManager _requestManager;

    static RequestManager getInstance() {
        if (_requestManager == null) {
            _requestManager = RequestManager();
        }
        return _requestManager;
    }

    RequestManager() {
        dio = Dio();
        dio.options.connectTimeout = 5000; // 5s
        dio.options.receiveTimeout = 3000;
    }

    get(String url, Map<String, dynamic> params,
            {Function success, Function failure}) async {
        try {
            Response response;
            response = await dio.get(url, queryParameters: params);
            Map data = json.decode(response.toString());
            success(data);
        } catch (e) {
            print("RequestManager - e ${e}");
            failure(e);
        }
    }
}