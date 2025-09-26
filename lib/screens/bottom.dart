// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class WebsiteFooter extends StatelessWidget {
  final String companyName;
  final String email;
  final String phone;
  final String address;

  final Color backgroundColor;
  final Color textColor;
  final Color linkColor;

  const WebsiteFooter({
    super.key,
    this.companyName = "Your Hospital Name",
    this.email = "contact@yourhospital.com",
    this.phone = "+91 7356905099",
    this.address =
        "BETHSAIDA, OPPOSITE MULLUVILA POST OFFICE, TRIVANDRUM, KERALA, 695133",
    this.backgroundColor = const Color(0xFF2C3E50),
    this.textColor = Colors.white,
    this.linkColor = const Color(0xFF3498DB),
  });

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> _launchLocation() async {
    final Uri locationUri = Uri.parse(
      'https://maps.app.goo.gl/AdyKeEvQ4psmHk9u5?g_st=iw',
    );

    if (!await launchUrl(locationUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch location');
    }
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          // Main footer content
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                bool isDesktop = constraints.maxWidth > 768;

                if (isDesktop) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Company info section with logo
                      Expanded(flex: 2, child: _buildCompanySection()),
                      const SizedBox(width: 40),
                      Spacer(),
                      // Contact info section
                      Expanded(flex: 2, child: _buildContactSection()),
                      // const SizedBox(width: 40),
                      // // Quick links section
                      // Expanded(flex: 1, child: _buildQuickLinksSection()),
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildCompanySection(),
                      const SizedBox(height: 30),
                      _buildContactSection(),
                      // const SizedBox(height: 30),
                      // _buildQuickLinksSection(),
                    ],
                  );
                }
              },
            ),
          ),

          const SizedBox(height: 30),

          // Divider
          Container(
            height: 1,
            color: textColor.withOpacity(0.2),
            margin: const EdgeInsets.symmetric(vertical: 20),
          ),

          // Copyright section
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: _buildCopyrightSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hospital Logo and Name Row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Logo Container
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: textColor.withOpacity(0.3), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback hospital icon if logo fails to load
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            linkColor.withOpacity(0.8),
                            linkColor.withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Company Name
            Expanded(
              child: Text(
                companyName,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          "Providing exceptional healthcare services with compassion and excellence. Your health and wellbeing are our top priority.",
          style: TextStyle(
            fontSize: 14,
            color: textColor.withOpacity(0.8),
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Information",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 15),
        _buildContactItem(icon: Icons.email, text: email, onTap: _launchEmail),
        const SizedBox(height: 10),
        _buildContactItem(icon: Icons.phone, text: phone, onTap: _launchPhone),
        const SizedBox(height: 10),
        _buildContactItem(
          icon: Icons.location_on,
          text: address,
          onTap: _launchLocation,
        ),
        const SizedBox(height: 10),
        // _buildContactItem(
        //   icon: Icons.access_time,
        //   text: "Emergency: 24/7 Available",
        //   onTap: null,
        // ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: linkColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: onTap != null ? linkColor : textColor.withOpacity(0.8),
                decoration: onTap != null ? TextDecoration.underline : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinksSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        const SizedBox(height: 15),
        _buildQuickLink("Instagram", () => _launchUrl('https://instagram.com')),
        _buildQuickLink("Facebook", () => _launchUrl('https://facebook.com')),
        _buildQuickLink(
          "WhatsApp",
          () => _launchUrl('https://wa.me/15551234567'),
        ),
        _buildQuickLink(
          "Location",
          () => _launchUrl('https://maps.google.com'),
        ),
      ],
    );
  }

  Widget _buildQuickLink(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: linkColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildCopyrightSection() {
    return Text(
      "© ${DateTime.now().year} $companyName. All rights reserved",
      style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.7)),
      textAlign: TextAlign.center,
    );
  }
}
