import 'package:ashish_ayurveda/exampl/meet_expert_instructor_widget.dart';
import 'package:ashish_ayurveda/screens/bottom.dart';
import 'package:ashish_ayurveda/screens/home_screen.dart';
import 'package:ashish_ayurveda/uitls.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _treatmentsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Home Section
            Container(
              key: _homeKey,
              child: HomeScreen(
                onNavigate: _scrollToSection,
                homeKey: _homeKey,
                treatmentsKey: _treatmentsKey,
                contactKey: _contactKey,
              ),
            ),

            // Treatments Section
            Container(
              key: _treatmentsKey,
              child: ModernResponsiveTreatmentWidget(
                treatments: sampleInstructors,
              ),
            ),

            // Contact Section (Footer)
            Container(
              key: _contactKey,
              child: WebsiteFooter(
                companyName: companyName,
                email: companyEmail,
                phone: companyPhone,
                address: companyAddress,
                backgroundColor: Color(0xFF1A252F),
                textColor: Colors.white,
                linkColor: Color(0xFF64FFDA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
