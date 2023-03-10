class Constant {
  static const String baseURL = "http://10.0.2.2:3000/";

  // For testing
  // static const String baseURL = "http://localhost:3000/";

  // for mobile
  // static const String baseURL = "http://192.168.1.67:3000/";

  // ----------------Student URL----------------
  static const String userLoginURL = "user/login";
  static const String userRegisterURL = "user/register";
  static const String user =  "user/";

  // static const String userURL = "user";
  static const String userImageURL = "http://10.0.2.2:3000/uploads/";

  // -----------------Product URL----------------
  static const String productURL = "product/";

  //---------------category URL------------------
  static const String categoryURL = "category/";

  // For storing token or you can store token in shared preferences
  static String token = "";

  // For storing user id or you can store user id in shared preferences
  static String userid = "";
}
