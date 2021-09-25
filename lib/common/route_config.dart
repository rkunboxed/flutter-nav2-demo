//object we will use to describe our current path
class DemoAppRouteConfig {
  final String? country;
  final bool isUnknown;

  //define initializers for the types of pages
  DemoAppRouteConfig.home()
      : country = null,
        isUnknown = false;

  DemoAppRouteConfig.country(this.country) : isUnknown = false;

  DemoAppRouteConfig.unknown()
      : country = null,
        isUnknown = true;

  //getters for the types
  bool get isHomePage => country == null;

  bool get isCountryPage => country != null;

  @override
  String toString() => 'country: $country, isHomePage: $isHomePage, isCountryPage: $isCountryPage, isUnknown: $isUnknown';
}
