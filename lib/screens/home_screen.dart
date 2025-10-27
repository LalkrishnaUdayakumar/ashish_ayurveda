import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = _isMobile(context);

    return isMobile ? _buildMobileLayout() : _buildDesktopLayout();
  }

  // ========== MOBILE LAYOUT ==========
  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Top section with image and navigation
        Stack(
          children: [
            // Background Image - Fixed height
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/mainScreen/img1.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),

            // Navigation Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildMobileNavigation(),
            ),
          ],
        ),

        // Bottom section with content
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1a1410), Color(0xFF2d2318)],
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD4A574).withOpacity(0.2),
                    border: Border.all(
                      color: Color(0xFFD4A574).withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Welcome to Ashish',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Main Heading
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Discover the ",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: "Power",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4A574),
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: " of Ayurveda with Our Trusted ",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                      TextSpan(
                        text: "Experts",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4A574),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                Text(
                  "Experience ancient wisdom through modern healthcare. Our certified Ayurvedic practitioners blend traditional healing methods with contemporary wellness approaches.",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: Colors.white70,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 24),

                // Certified Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.verified, color: Color(0xFFD4A574), size: 14),
                      const SizedBox(width: 6),
                      Text(
                        'Certified Ayurvedic Center',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Contact Info
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFF25D366).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Color(0xFF25D366),
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '+91 1234567890',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                Text(
                  'info@ashishayurveda.com',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Thiruvananthapuram, Kerala',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          FadeTransition(
            opacity: _fadeAnimation,
            child: InkWell(
              onTap: () => _handleNavigation('Home'),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ASHISH',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        'Ayurveda Hospital',
                        style: GoogleFonts.inter(
                          fontSize: 9,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Menu Button
          FadeTransition(
            opacity: _fadeAnimation,
            child: PopupMenuButton<String>(
              onSelected: _handleNavigation,
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: const Icon(Icons.menu, color: Colors.white, size: 20),
              ),
              itemBuilder: (context) => [
                _buildMobileMenuItem('Home', _activeNavItem == 'Home'),
                _buildMobileMenuItem(
                  'Treatments',
                  _activeNavItem == 'Treatments',
                ),
                _buildMobileMenuItem('Contact', _activeNavItem == 'Contact'),
              ],
              color: Colors.black.withOpacity(0.9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Color(0xFFD4A574).withOpacity(0.3)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildMobileMenuItem(String title, bool isActive) {
    return PopupMenuItem<String>(
      value: title,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isActive
              ? Color(0xFFD4A574).withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? Color(0xFFD4A574) : Colors.white70,
          ),
        ),
      ),
    );
  }

  // ========== DESKTOP LAYOUT ==========
  Widget _buildDesktopLayout() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildDesktopBackground(),
          _buildDesktopNavigation(),
          _buildDesktopContent(),
          _buildFloatingElements(),
        ],
      ),
    );
  }

  Widget _buildDesktopBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainScreen/img1.png'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.4),
              Color(0xFFD4A574).withOpacity(0.2),
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopNavigation() {
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
          children: [_buildLogo(), const Spacer(), _buildNavigationItems()],
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
                    color: Color(0xFFD4A574).withOpacity(0.3),
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
          color: isActive
              ? Color(0xFFD4A574).withOpacity(0.2)
              : Colors.transparent,
          border: isActive
              ? Border.all(color: Color(0xFFD4A574).withOpacity(0.4), width: 1)
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

  Widget _buildDesktopContent() {
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFD4A574).withOpacity(0.2),
                  border: Border.all(
                    color: Color(0xFFD4A574).withOpacity(0.4),
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Discover the ",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: "Power",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4A574),
                        height: 1.2,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            color: Color(0xFFD4A574).withOpacity(0.5),
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
                        height: 1.2,
                      ),
                    ),
                    TextSpan(
                      text: "Experts",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD4A574),
                        height: 1.2,
                        shadows: [
                          Shadow(
                            offset: const Offset(0, 2),
                            blurRadius: 8,
                            color: Color(0xFFD4A574).withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingElements() {
    return Positioned(
      bottom: 100,
      left: 60,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                  Icon(Icons.verified, color: Color(0xFFD4A574), size: 16),
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
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFF25D366).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Color(0xFF25D366),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '+91 1234567890',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'info@ashishayurveda.com',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Thiruvananthapuram, Kerala',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white70,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
