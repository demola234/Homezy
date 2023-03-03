import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:homezy/core/global/constants/app_icons.dart';
import 'package:homezy/core/global/constants/size.dart';
import 'package:homezy/core/widgets/home_button.dart';
import 'package:homezy/features/authentication/presentation/login/widgets/app_header.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyEmailOtp extends ConsumerStatefulWidget {
  final String? email;
  const VerifyEmailOtp({Key? key, this.email}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerifyEmailOtpState();
}

class _VerifyEmailOtpState extends ConsumerState<VerifyEmailOtp> {
  CountdownController? _countdownController;
  late String otp;
  bool isEnabled = false;
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey,
        width: 0.5,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
                child: Column(children: [
              const Align(
                alignment: Alignment.topLeft,
                child: AppUserHeader(),
              ),
              const VerticalMargin(20),
              Text(
                'Verify OTP',
                style: Config.h1(context).copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const VerticalMargin(5.0),
              Text(
                'Enter the OTP sent to your email address',
                style: Config.b3(context).copyWith(
                  color: Theme.of(context).cardColor,
                  fontSize: 14,
                ),
              ),
              const VerticalMargin(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppIcons.check,
                    ),
                    const HorizontalMargin(3),
                    Text(
                      widget.email!,
                      textAlign: TextAlign.left,
                      style: Config.b2(context).copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).cardColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalMargin(20),
              Text(
                'Enter the 6 digit OTP',
                style: Config.h1(context).copyWith(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const VerticalMargin(20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Pinput(
                  defaultPinTheme: defaultPinTheme,
                  listenForMultipleSmsOnAndroid: true,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                  length: 6,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  keyboardType: TextInputType.number,
                  onChanged: (newOtp) {
                    setState(() {
                      otp = newOtp;
                    });
                    if (otp.isNotEmpty && otp.length == 6) {
                      setState(() {
                        isEnabled = true;
                      });
                    } else {
                      setState(() {
                        isEnabled = false;
                      });
                    }
                  },
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
              const VerticalMargin(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Countdown(
                    seconds: 60,
                    build: (BuildContext context, double time) {
                      final canResend = time.toInt() == 0;
                      return GestureDetector(
                        onTap: canResend
                            // ignore: unnecessary_lambdas
                            ? () {}
                            : null,
                        child: Text(
                          canResend
                              ? 'Resend code'
                              : 'Resend code in '
                                  '${time.toInt().toString()}  secs',
                          style: Config.b2(context)
                              .copyWith(color: Theme.of(context).cardColor),
                        ),
                      );
                    },
                    controller: _countdownController,
                  ),
                ),
              ),
              const VerticalMargin(35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: HomezyButton(
                    buttonText: 'Verify OTP',
                    buttonColor: Theme.of(context).primaryColor,
                    onPressed: () {}),
              ),
            ]))));
  }
}
