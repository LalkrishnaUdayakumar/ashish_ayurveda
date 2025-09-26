// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final Function(GlobalKey)? onNavigate;
  final GlobalKey? homeKey;
  final GlobalKey? treatmentsKey;
  final GlobalKey? contactKey;

  const HomeScreen({
    super.key,
    this.onNavigate,
    this.homeKey,
    this.treatmentsKey,
    this.contactKey,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  String _activeNavItem = 'Home';

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _handleNavigation(String navItem) {
    setState(() {
      _activeNavItem = navItem;
    });

    if (widget.onNavigate != null) {
      switch (navItem) {
        case 'Home':
          if (widget.homeKey != null) {
            widget.onNavigate!(widget.homeKey!);
          }
          break;
        case 'Treatments':
          if (widget.treatmentsKey != null) {
            widget.onNavigate!(widget.treatmentsKey!);
          }
          break;
        case 'Contact':
          if (widget.contactKey != null) {
            widget.onNavigate!(widget.contactKey!);
          }
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Enhanced Background with Gradient Overlay
          _buildBackground(),

          // Modern Navigation Bar
          _buildNavigationBar(),

          // Main Content
          _buildMainContent(),

          // Floating Action Elements
          _buildFloatingElements(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainScreen/img1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.4),
              Colors.green.withOpacity(0.2),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.3), Colors.transparent],
          ),
        ),
        child: Row(
          children: [
            // Logo Section
            _buildLogo(),
            const Spacer(),
            // Navigation Items
            _buildNavigationItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: InkWell(
        onTap: () => _handleNavigation('Home'),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ASHISH',
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 3,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Ayurveda Hospital',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItems() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Row(
        children: [
          _buildNavItem('Home', _activeNavItem == 'Home'),
          _buildNavItem('Treatments', _activeNavItem == 'Treatments'),
          _buildNavItem('Contact', _activeNavItem == 'Contact'),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, bool isActive) {
    return InkWell(
      onTap: () => _handleNavigation(title),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isActive ? Colors.green.withOpacity(0.2) : Colors.transparent,
          border: isActive
              ? Border.all(color: Colors.green.withOpacity(0.4), width: 1)
              : null,
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? Colors.white : Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Positioned(
      top: 180,
      left: 60,
      right: 60,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green.withOpacity(0.2),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.4),
                    width: 1,
                  ),
                ),
                child: Text(
                  'Welcome to Ashish',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Main Heading
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Discover the ",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: "Power",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade300,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            color: Colors.green.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: " of\nAyurveda with Our\nTrusted ",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: "Experts",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade300,
                        height: 1.1,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            color: Colors.green.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Subtitle
              Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Text(
                  "Experience ancient wisdom through modern healthcare. Our certified Ayurvedic practitioners blend traditional healing methods with contemporary wellness approaches.",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // // Action Buttons
              // Row(
              //   children: [
              //     _buildPrimaryButton(),
              //     const SizedBox(width: 20),
              //     _buildSecondaryButton(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Colors.green.shade400, Colors.green.shade600],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.4),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => _handleNavigation('Treatments'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Book Consultation',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
        color: Colors.white.withOpacity(0.1),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Watch Video',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingElements() {
    return Stack(
      children: [
        // Floating Trust Badge
        Positioned(
          bottom: 100,
          left: 60,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.1),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.verified, color: Colors.green.shade300, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Certified Ayurvedic Center',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
