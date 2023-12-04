import 'package:flutter/material.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Login",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            /*
            const Spacer(),
            Expanded(
              flex: 8,
              child: Container(
                width: 500.00,
                height: 500.00,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),*/
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
