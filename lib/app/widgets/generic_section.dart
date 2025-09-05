import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/helpers/responsive_helper.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';
import 'package:portfolio_webapp/app/widgets/photo_box.dart';

class GenericSection extends StatelessWidget {
  const GenericSection({
    super.key,
    required this.title,
    required this.content,
    this.photo,
    this.photoBorderColor,
    this.photoWidth = 250,
    this.contentAlignment = CrossAxisAlignment.center,
    this.showDivider = true,
    this.dividerIndent = 100,
    this.dividerEndIndent = 100,
  });

  final String title;
  final String content;
  final String? photo;
  final Color? photoBorderColor;
  final double photoWidth;
  final CrossAxisAlignment contentAlignment;
  final bool showDivider;
  final double dividerIndent;
  final double dividerEndIndent;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      width: double.infinity,
      color: CustomTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: isMobile ? 400 : 900),
          child: isMobile ? _buildMobile(context) : _buildWeb(context),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: contentAlignment,
        children: [
          //const SizedBox(height: 20),
          SelectableText(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: CustomTheme.secondaryColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          if (showDivider)
            SizedBox(
              width: 200,
              child: Divider(
                thickness: 0.1,
              ),
            ),
          const SizedBox(height: 15),
          SelectableText(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.6,
              fontSize: ResponsiveHelper.isMobile(context) ? 14 : 16,
            ),
          ),
          if (photo != null) ...[
            const SizedBox(height: 20),
            PhotoBox(
              photo: photo!,
              borderColor: photoBorderColor ?? CustomTheme.secondaryColor,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWeb(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: contentAlignment,
        children: [
          //const SizedBox(height: 20),
          SelectableText(
            title,
            style: Theme.of(context)
                .textTheme
                .displayMedium
                ?.copyWith(color: CustomTheme.secondaryColor),
          ),
          const SizedBox(height: 8),
          if (showDivider)
            Divider(
              color: CustomTheme.secondaryColor,
              thickness: 0.1,
              indent: dividerIndent,
              endIndent: dividerEndIndent,
            ),
          const SizedBox(height: 20),
          if (photo != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: SelectableText(
                    content,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      height: 1.6,
                      fontSize: ResponsiveHelper.isMobile(context) ? 14 : 16,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  width: photoWidth,
                  child: PhotoBox(
                    photo: photo!,
                    borderColor: photoBorderColor ?? CustomTheme.secondaryColor,
                  ),
                ),
              ],
            )
          else
            SelectableText(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontSize: ResponsiveHelper.isMobile(context) ? 14 : 16,
              ),
            ),
        ],
      ),
    );
  }
}
