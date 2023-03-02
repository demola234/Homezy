class OnboardModel {
  OnboardModel({
    required this.text,
    required this.desc,
  });
  String text;
  String desc;
}

List<OnboardModel> onboarding = <OnboardModel>[
  
  OnboardModel(
    text: 'Discover beautiful \nApartments all over \nthe world!',
    desc:
        'Welcome to the world of beautiful apartments! We are excited to have you join our real estate community, and we can\'t wait to show you all the amazing apartments waiting for you to discover.',
  ),
  OnboardModel(
    text: 'Explore your dream \nApartment!',
    desc:
        'As you explore our app, you\'ll find that we\'ve made it incredibly easy to find your dream apartment. Our user-friendly interface allows you to filter apartments by location, price, size, and amenities to ensure you find exactly what you\'re looking for.',
  ),
  OnboardModel(
    text: 'Become an Agent \nand sell your \nproperties!',
    desc:
        'We know that searching for an apartment can be overwhelming, but we\'re here to make the process as smooth and stress-free as possible. Our team of experts is always on hand to answer any questions you might have and offer personalized advice to ensure you find the perfect place to call home.',
  ),
];
