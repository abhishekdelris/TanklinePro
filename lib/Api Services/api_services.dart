

class ApiServices {

   final String _baseUrl =   'https://tanklinepro.com/commonapp/index.php/'/*const String.fromEnvironment("BASE_URL")*/ /*dotenv.env["BASE_URL"] ?? ""*/;

   String get baseUrl => _baseUrl;

  //api url
  ///auth
  String get login => "$baseUrl/user/login";
  String get verifyNewUser => "$baseUrl/user/send_otp";
  String get verifyOtp => "$baseUrl/user/verify_otp";

   ///policies, terms & Conditions
   String get getSetting => "$baseUrl/terms/get_terms_conditions";

  ///home
  String get addPayment => "$baseUrl/payment/process";
  String get getSliderImages => "$baseUrl/banner/get_banners";
  String get getProduct => "$baseUrl/products/get_products";


  ///manage cart
   String get addToCart => "$baseUrl/cart/add_to_cart";
   String get getCart => "$baseUrl/cart/get_cart";
   String get getSaveLater => "$baseUrl/cart/save_for_later";
   String get removeFromCart => "$baseUrl/cart/remove_cart";

   ///manage address
   String get getAddresses => "$baseUrl/user/get_address";
   String get getPostOfficesData => "http://www.postalpincode.in/api/pincode/";
   String get addNewAddress => "$baseUrl/user/add_address";
   String get deleteAddress => "$baseUrl/user/delete_address";
   String get updateAddress => "$baseUrl/user/update_address";

   /// manage orders
   // String get checkDeliverable => "$baseUrl/is_product_delivarable";
   String get getOrder => "$baseUrl/cart/get_orders";
   String get placeOrder => "$baseUrl/cart/place_order";

   ///payment history
   String get transactions => "$baseUrl/payment/transactions";

   /// get Wallet manage
  String get getWallet => "$baseUrl/get_wallet";

}
