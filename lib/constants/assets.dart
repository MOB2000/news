class Assets {
  Assets._();

  static const String logo = 'assets/icons/logo.jpg';
  static const String placeholder = 'assets/img/placeholder.jpg';

  static String sourceIcon(String sourceId) => "assets/logos/$sourceId.png";
}
