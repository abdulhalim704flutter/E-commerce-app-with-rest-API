class Urls{
  Urls._();
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';
  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOTP(String email,String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static String getProductByRemarks(String remarks) => '$_baseUrl/ListProductByRemark/$remarks';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String getCategories = '$_baseUrl/CategoryList';

}