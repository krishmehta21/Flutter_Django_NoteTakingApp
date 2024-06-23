const String baseUrl = 'http://192.168.1.133:8000/';

String retrieveUrl() => '${baseUrl}notes';
String noteByIdUrl(int id) => '${baseUrl}notes/$id';
String createUrl() => '${baseUrl}notes/create/';
String updateUrl(int id) => '${baseUrl}notes/$id/update/';
String deleteUrl(int id) => '${baseUrl}notes/$id/delete/';
