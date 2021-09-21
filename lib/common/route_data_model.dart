class DemoAppRouteData {
  final String? country;
  final bool isUnknown;

  DemoAppRouteData.home()
      : country = null,
        isUnknown = false;

  DemoAppRouteData.country(this.country) : isUnknown = false;

  DemoAppRouteData.unknown()
      : country = null,
        isUnknown = true;

  bool get isHomePage => country == null;

  bool get isCountryPage => country != null;

  @override
  String toString() => 'country: $country, isHomePage: $isHomePage, isCountryPage: $isCountryPage, isUnknown: $isUnknown';
}
