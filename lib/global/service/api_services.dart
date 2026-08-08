import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../constant/api_constant.dart';
import 'auth/token_manager.dart';

class ApiService {
  static Future<Map<String, String>> _getHeaders({bool includeAuth = false}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (includeAuth) {
      final token = await TokenManager.getValidAccessToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  static void _logRequest(String method, Uri url, Map<String, String> headers, [dynamic body]) {
    log('--- API REQUEST ($method) ---');
    log('URL: $url');
    log('Headers: $headers');
    if (body != null) {
      log('Body: $body');
    }
  }

  static void _logResponse(String method, http.Response response) {
    log('--- API RESPONSE ($method) ---');
    log('Status: ${response.statusCode}');
    log('Body: ${response.body}');
    log('---------------------------');
  }

  static Future<http.Response> post({
    required String endpoint,
    required Map<String, dynamic> body,
    bool includeAuth = false,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final headers = await _getHeaders(includeAuth: includeAuth);
    final jsonBody = jsonEncode(body);
    
    _logRequest('POST', url, headers, jsonBody);

    final response = await http.post(
      url,
      headers: headers,
      body: jsonBody,
    );
    
    _logResponse('POST', response);
    return response;
  }

  static Future<http.Response> get({
    required String endpoint,
    bool includeAuth = false,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final headers = await _getHeaders(includeAuth: includeAuth);

    _logRequest('GET', url, headers);

    final response = await http.get(
      url,
      headers: headers,
    );

    _logResponse('GET', response);
    return response;
  }

  static Future<http.Response> patch({
    required String endpoint,
    required Map<String, dynamic> body,
    bool includeAuth = false,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final headers = await _getHeaders(includeAuth: includeAuth);
    final jsonBody = jsonEncode(body);

    _logRequest('PATCH', url, headers, jsonBody);

    final response = await http.patch(
      url,
      headers: headers,
      body: jsonBody,
    );

    _logResponse('PATCH', response);
    return response;
  }

  static Future<http.Response> delete({
    required String endpoint,
    bool includeAuth = false,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final headers = await _getHeaders(includeAuth: includeAuth);

    _logRequest('DELETE', url, headers);

    final response = await http.delete(
      url,
      headers: headers,
    );

    _logResponse('DELETE', response);
    return response;
  }

  static Future<http.Response> postMultipart({
    required String endpoint,
    required Map<String, dynamic> fields,
    Map<String, List<http.MultipartFile>>? files,
    bool includeAuth = false,
  }) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final request = http.MultipartRequest('POST', url);

    // Add authorization header
    if (includeAuth) {
      final token = await TokenManager.getValidAccessToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
    }

    // Add form fields (non-file data)
    fields.forEach((key, value) {
      if (value != null) {
        request.fields[key] = value.toString();
      }
    });

    // Add files
    if (files != null) {
      files.forEach((fieldName, fileList) {
        for (var file in fileList) {
          request.files.add(file);
        }
      });
    }

    log('--- API REQUEST (MULTIPART POST) ---');
    log('URL: $url');
    log('Headers: ${request.headers}');
    log('Fields: ${request.fields}');
    log('Files: ${files?.keys.toList()}');

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    
    _logResponse('MULTIPART POST', response);
    return response;
  }
}
