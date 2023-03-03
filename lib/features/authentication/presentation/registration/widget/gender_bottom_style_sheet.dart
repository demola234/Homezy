import 'package:flutter/material.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/global/model/gender_model.dart';


class GenderBottomSheet extends StatefulWidget {
  const GenderBottomSheet({
    super.key,
  });

  @override
  State<GenderBottomSheet> createState() => _GenderBottomSheetSheetState();
}

class _GenderBottomSheetSheetState extends State<GenderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.75,
      decoration:  BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3E9F2),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          const VerticalMargin(24),
          ...ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              Gender.genderType.length,
              (index) {
                final gender = Gender.genderType[index];
                return ListTile(
                  onTap: () {
                    Navigator.of(context).pop(gender.name);
                  },
                  title: Text(
                    Gender.genderType[index].name,
                    textAlign: TextAlign.center,
                    style: Config.b2(context).copyWith(color: Theme.of(context).colorScheme.secondary),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
