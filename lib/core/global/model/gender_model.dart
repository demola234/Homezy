class Gender {
  Gender({
    required this.name,
  });
  late final String name;

  static final List<Gender> genderType = [
    Gender(
      name: 'Male',
    ),
    Gender(
      name: 'Female',
    ),
    Gender(
      name: 'Others',
    ),
  ];
}
