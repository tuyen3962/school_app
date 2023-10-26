class RestApiRoute {
  static const String baseUrl = "http://localhost:3000";

  static String _getApiLink(String api) => baseUrl + api;

  static const String _adminLogin = '/admin/login';
  static String get adminLogin => _getApiLink(_adminLogin);
}
