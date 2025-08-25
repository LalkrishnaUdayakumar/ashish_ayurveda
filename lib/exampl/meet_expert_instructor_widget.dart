import 'package:ashish_ayurveda/exampl/InstructorCard.dart';
import 'package:ashish_ayurveda/exampl/instructor_model.dart';
import 'package:flutter/material.dart';

class ModernResponsiveTreatmentWidget extends StatelessWidget {
  final List<InstructorModel> treatments;

  const ModernResponsiveTreatmentWidget({super.key, required this.treatments});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Enhanced responsive breakpoints
        int crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        double childAspectRatio = _getChildAspectRatio(constraints.maxWidth);

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth > 1200 ? 80 : 24,
              vertical: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, constraints),
                const SizedBox(height: 48),
                _buildTreatmentGrid(crossAxisCount, childAspectRatio),
              ],
            ),
          ),
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 640) return 1;
    if (width < 1024) return 2;
    if (width < 1440) return 3;
    if (width < 1920) return 4;
    return 5;
  }

  double _getChildAspectRatio(double width) {
    if (width < 640) return 1.4;
    if (width < 1024) return 0.85;
    return 0.75;
  }

  Widget _buildHeader(BuildContext context, BoxConstraints constraints) {
    final isTabletOrDesktop = constraints.maxWidth > 768;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      child: isTabletOrDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildTitleSection()),
                const SizedBox(width: 40),
                Expanded(flex: 2, child: _buildDescriptionSection()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleSection(),
                const SizedBox(height: 24),
                _buildDescriptionSection(),
              ],
            ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: const Text(
            'AYURVEDIC TREATMENTS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Holistic Healing\nTreatments at\nAshish Ayurveda',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.1,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Experience authentic Ayurvedic healing with our comprehensive range of treatments. Each therapy is designed to restore balance and promote natural wellness.",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.verified_outlined,
                color: Colors.greenAccent,
                size: 20,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Certified practitioners • Natural ingredients • Personalized care',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white60,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTreatmentGrid(int crossAxisCount, double childAspectRatio) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: treatments.length,
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 400 + (index * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: ModernTreatmentCard(treatment: treatments[index]),
              ),
            );
          },
        );
      },
    );
  }
}
