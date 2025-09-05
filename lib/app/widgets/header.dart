import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/photo_box.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      width: double.infinity,
      color: CustomTheme.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PhotoBox(
                  photo: 'images/dev_photo.jpg',
                  borderColor: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  "Hi there, I'm",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: CustomTheme.secondaryColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'BRUNO PIRES',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: CustomTheme.secondaryColor, fontSize: 45),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Mobile Software Developer',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: CustomTheme.secondaryColor, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                      child: const PhotoBox(
                    photo: 'images/dev_photo.jpg',
                    borderColor: Colors.white,
                  )),
                ),
                const SizedBox(width: 40),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Hi there, I'm",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: CustomTheme.secondaryColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'BRUNO MARCHI PIRES',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(color: CustomTheme.secondaryColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Mobile Software Developer',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(color: CustomTheme.secondaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
