// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   final Function(GlobalKey)? onNavigate;
//   final GlobalKey? homeKey;
//   final GlobalKey? treatmentsKey;
//   final GlobalKey? contactKey;

//   const HomeScreen({
//     super.key,
//     this.onNavigate,
//     this.homeKey,
//     this.treatmentsKey,
//     this.contactKey,
//   });

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;
//   String _activeNavItem = 'Home';

//   @override
//   void initState() {
//     super.initState();
//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1700),
//       vsync: this,
//     );
//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 1700),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero).animate(
//           CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
//         );

//     _fadeController.forward();
//     _slideController.forward();
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     super.dispose();
//   }

//   void _handleNavigation(String navItem) {
//     setState(() {
//       _activeNavItem = navItem;
//     });

//     if (widget.onNavigate != null) {
//       switch (navItem) {
//         case 'Home':
//           if (widget.homeKey != null) {
//             widget.onNavigate!(widget.homeKey!);
//           }
//           break;
//         case 'Treatments':
//           if (widget.treatmentsKey != null) {
//             widget.onNavigate!(widget.treatmentsKey!);
//           }
//           break;
//         case 'Contact':
//           if (widget.contactKey != null) {
//             widget.onNavigate!(widget.contactKey!);
//           }
//           break;
//       }
//     }
//   }

//   // Helper method to determine if device is mobile
//   bool _isMobile(BuildContext context) {
//     return MediaQuery.of(context).size.width < 600;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isMobile = _isMobile(context);
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double containerHeight = isMobile ? screenHeight * 0.7 : screenHeight;

//     return SizedBox(
//       height: containerHeight,
//       child: Stack(
//         children: [
//           // Enhanced Background with Gradient Overlay
//           _buildBackground(),

//           // Modern Navigation Bar
//           _buildNavigationBar(isMobile),

//           // Main Content - Now responsive
//           _buildMainContent(isMobile),

//           // Floating Action Elements
//           if (!isMobile) _buildFloatingElements(),
//         ],
//       ),
//     );
//   }

//   Widget _buildBackground() {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/images/mainScreen/img1.png'),
//           fit: BoxFit.cover,
//           alignment: Alignment.center,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.black.withOpacity(0.4),
//               Colors.green.withOpacity(0.2),
//               Colors.black.withOpacity(0.6),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNavigationBar(bool isMobile) {
//     return Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: isMobile ? 16 : 30,
//           vertical: isMobile ? 10 : 20,
//         ),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.black.withOpacity(0.3), Colors.transparent],
//           ),
//         ),
//         child: isMobile ? _buildMobileNavigation() : _buildDesktopNavigation(),
//       ),
//     );
//   }

//   Widget _buildMobileNavigation() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Centered Mobile Logo
//         _buildMobileLogo(),

//         // Mobile Menu Button (centered)
//         _buildMobileMenuButton(),
//       ],
//     );
//   }

//   Widget _buildDesktopNavigation() {
//     return Row(
//       children: [
//         // Logo Section
//         _buildLogo(),
//         const Spacer(),
//         // Navigation Items
//         _buildNavigationItems(),
//       ],
//     );
//   }

//   Widget _buildMobileLogo() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: InkWell(
//         onTap: () => _handleNavigation('Home'),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.3),
//                   width: 2,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.green.withOpacity(0.3),
//                     blurRadius: 12,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'ASHISH',
//                   style: GoogleFonts.lato(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: 2.0,
//                     shadows: [
//                       Shadow(
//                         offset: const Offset(0, 1),
//                         blurRadius: 3,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   'Ayurveda Hospital',
//                   style: GoogleFonts.inter(
//                     fontSize: 12,
//                     color: Colors.white70,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 1.0,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileMenuButton() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: Center(
//         child: PopupMenuButton<String>(
//           onSelected: _handleNavigation,
//           icon: Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.white.withOpacity(0.1),
//               border: Border.all(color: Colors.white.withOpacity(0.2)),
//             ),
//             child: const Icon(Icons.menu, color: Colors.white, size: 20),
//           ),
//           itemBuilder: (context) => [
//             _buildMobileMenuItem('Home', _activeNavItem == 'Home'),
//             _buildMobileMenuItem('Treatments', _activeNavItem == 'Treatments'),
//             _buildMobileMenuItem('Contact', _activeNavItem == 'Contact'),
//           ],
//           color: Colors.black.withOpacity(0.9),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//             side: BorderSide(color: Colors.green.withOpacity(0.3)),
//           ),
//         ),
//       ),
//     );
//   }

//   PopupMenuItem<String> _buildMobileMenuItem(String title, bool isActive) {
//     return PopupMenuItem<String>(
//       value: title,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: isActive ? Colors.green.withOpacity(0.2) : Colors.transparent,
//         ),
//         child: Text(
//           title,
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//             color: isActive ? Colors.green.shade300 : Colors.white70,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: InkWell(
//         onTap: () => _handleNavigation('Home'),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.3),
//                   width: 2,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.green.withOpacity(0.3),
//                     blurRadius: 15,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 width: 50,
//                 height: 50,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 15),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'ASHISH',
//                   style: GoogleFonts.lato(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     letterSpacing: 3,
//                     shadows: [
//                       Shadow(
//                         offset: const Offset(0, 2),
//                         blurRadius: 4,
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   'Ayurveda Hospital',
//                   style: GoogleFonts.inter(
//                     fontSize: 12,
//                     color: Colors.white70,
//                     fontWeight: FontWeight.w400,
//                     letterSpacing: 1.5,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNavigationItems() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: Row(
//         children: [
//           _buildNavItem('Home', _activeNavItem == 'Home'),
//           _buildNavItem('Treatments', _activeNavItem == 'Treatments'),
//           _buildNavItem('Contact', _activeNavItem == 'Contact'),
//         ],
//       ),
//     );
//   }

//   Widget _buildNavItem(String title, bool isActive) {
//     return InkWell(
//       onTap: () => _handleNavigation(title),
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: isActive ? Colors.green.withOpacity(0.2) : Colors.transparent,
//           border: isActive
//               ? Border.all(color: Colors.green.withOpacity(0.4), width: 1)
//               : null,
//         ),
//         child: Text(
//           title,
//           style: GoogleFonts.inter(
//             fontSize: 14,
//             fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
//             color: isActive ? Colors.white : Colors.white70,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMainContent(bool isMobile) {
//     return Positioned(
//       top: isMobile ? 120 : 180,
//       left: isMobile ? 16 : 60,
//       right: isMobile ? 16 : 60,
//       child: SlideTransition(
//         position: _slideAnimation,
//         child: FadeTransition(
//           opacity: _fadeAnimation,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Welcome Badge
//               Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isMobile ? 12 : 20,
//                   vertical: isMobile ? 6 : 8,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   color: Colors.green.withOpacity(0.2),
//                   border: Border.all(
//                     color: Colors.green.withOpacity(0.4),
//                     width: 1,
//                   ),
//                 ),
//                 child: Text(
//                   'Welcome to Ashish',
//                   style: GoogleFonts.inter(
//                     fontSize: isMobile ? 12 : 16,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white70,
//                   ),
//                 ),
//               ),
//               SizedBox(height: isMobile ? 16 : 30),

//               // Main Heading - Responsive
//               _buildMainHeading(isMobile),
//               SizedBox(height: isMobile ? 16 : 30),

//               // Subtitle - Responsive
//               Container(
//                 constraints: BoxConstraints(
//                   maxWidth: isMobile ? double.infinity : 500,
//                 ),
//                 child: Text(
//                   "Experience ancient wisdom through modern healthcare. Our certified Ayurvedic practitioners blend traditional healing methods with contemporary wellness approaches.",
//                   style: GoogleFonts.inter(
//                     fontSize: isMobile ? 12 : 14,
//                     color: Colors.white70,
//                     height: 1.6,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               SizedBox(height: isMobile ? 24 : 50),

//               // Add certified badge for mobile at bottom
//               if (isMobile) ...[
//                 const SizedBox(height: 30),
//                 _buildMobileCertificationBadge(),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMainHeading(bool isMobile) {
//     final double fontSize = isMobile ? 28 : 64;

//     return RichText(
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: "Discover the ",
//             style: GoogleFonts.playfairDisplay(
//               fontSize: fontSize,
//               fontWeight: FontWeight.w400,
//               color: Colors.white,
//               height: 1.1,
//             ),
//           ),
//           TextSpan(
//             text: "Power",
//             style: GoogleFonts.playfairDisplay(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.green.shade300,
//               height: 1.1,
//               shadows: [
//                 Shadow(
//                   offset: const Offset(0, 2),
//                   blurRadius: 8,
//                   color: Colors.green.withOpacity(0.5),
//                 ),
//               ],
//             ),
//           ),
//           TextSpan(
//             text: " of\nAyurveda with Our\nTrusted ",
//             style: GoogleFonts.playfairDisplay(
//               fontSize: fontSize,
//               fontWeight: FontWeight.w400,
//               color: Colors.white,
//               height: 1.1,
//             ),
//           ),
//           TextSpan(
//             text: "Experts",
//             style: GoogleFonts.playfairDisplay(
//               fontSize: fontSize,
//               fontWeight: FontWeight.bold,
//               color: Colors.green.shade300,
//               height: 1.1,
//               shadows: [
//                 Shadow(
//                   offset: const Offset(0, 2),
//                   blurRadius: 8,
//                   color: Colors.green.withOpacity(0.5),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMobileButtons() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: _buildPrimaryButton(isMobile: true),
//         ),
//         const SizedBox(height: 12),
//         SizedBox(
//           width: double.infinity,
//           child: _buildSecondaryButton(isMobile: true),
//         ),
//       ],
//     );
//   }

//   Widget _buildDesktopButtons() {
//     return Row(
//       children: [
//         _buildPrimaryButton(),
//         const SizedBox(width: 20),
//         _buildSecondaryButton(),
//       ],
//     );
//   }

//   Widget _buildPrimaryButton({bool isMobile = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         gradient: LinearGradient(
//           colors: [Colors.green.shade400, Colors.green.shade600],
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.green.withOpacity(0.4),
//             blurRadius: 20,
//             spreadRadius: 2,
//             offset: const Offset(0, 8),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: () => _handleNavigation('Treatments'),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile ? 20 : 30,
//             vertical: isMobile ? 12 : 15,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: Row(
//           mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Book Consultation',
//               style: GoogleFonts.inter(
//                 fontSize: isMobile ? 14 : 16,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 8),
//             const Icon(
//               Icons.arrow_forward_rounded,
//               color: Colors.white,
//               size: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSecondaryButton({bool isMobile = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
//         color: Colors.white.withOpacity(0.1),
//       ),
//       child: ElevatedButton(
//         onPressed: () {},
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile ? 20 : 30,
//             vertical: isMobile ? 12 : 15,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: Row(
//           mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(
//               Icons.play_circle_outline,
//               color: Colors.white,
//               size: 20,
//             ),
//             const SizedBox(width: 8),
//             Text(
//               'Watch Video',
//               style: GoogleFonts.inter(
//                 fontSize: isMobile ? 14 : 16,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMobileCertificationBadge() {
//     return FadeTransition(
//       opacity: _fadeAnimation,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white.withOpacity(0.1),
//           border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(Icons.verified, color: Colors.green.shade300, size: 14),
//             const SizedBox(width: 6),
//             Text(
//               'Certified Ayurvedic Center',
//               style: GoogleFonts.inter(
//                 fontSize: 10,
//                 color: Colors.white70,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFloatingElements() {
//     return Stack(
//       children: [
//         // Floating Trust Badge
//         Positioned(
//           bottom: 100,
//           left: 60,
//           child: FadeTransition(
//             opacity: _fadeAnimation,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Colors.white.withOpacity(0.1),
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.2),
//                   width: 1,
//                 ),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(Icons.verified, color: Colors.green.shade300, size: 16),
//                   const SizedBox(width: 8),
//                   Text(
//                     'Certified Ayurvedic Center',
//                     style: GoogleFonts.inter(
//                       fontSize: 12,
//                       color: Colors.white70,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use

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

  // Helper method to determine if device is mobile
  bool _isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = _isMobile(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double containerHeight = isMobile ? screenHeight * 0.7 : screenHeight;

    return SizedBox(
      height: containerHeight,
      child: Stack(
        children: [
          // Enhanced Background with Gradient Overlay
          _buildBackground(),

          // Modern Navigation Bar
          _buildNavigationBar(isMobile),

          // Main Content - Now responsive
          _buildMainContent(isMobile),

          // Floating Action Elements
          if (!isMobile) _buildFloatingElements(),
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
              Color(0xFFD4A574).withOpacity(0.2), // Warm amber/gold
              Colors.black.withOpacity(0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar(bool isMobile) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 30,
          vertical: isMobile ? 10 : 20,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black.withOpacity(0.3), Colors.transparent],
          ),
        ),
        child: isMobile ? _buildMobileNavigation() : _buildDesktopNavigation(),
      ),
    );
  }

  Widget _buildMobileNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Centered Mobile Logo
        _buildMobileLogo(),

        // Mobile Menu Button (centered)
        _buildMobileMenuButton(),
      ],
    );
  }

  Widget _buildDesktopNavigation() {
    return Row(
      children: [
        // Logo Section
        _buildLogo(),
        const Spacer(),
        // Navigation Items
        _buildNavigationItems(),
      ],
    );
  }

  Widget _buildMobileLogo() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: InkWell(
        onTap: () => _handleNavigation('Home'),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFD4A574).withOpacity(0.3), // Warm amber
                    blurRadius: 12,
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
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ASHISH',
                  style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        offset: const Offset(0, 1),
                        blurRadius: 3,
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
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuButton() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Center(
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
            _buildMobileMenuItem('Treatments', _activeNavItem == 'Treatments'),
            _buildMobileMenuItem('Contact', _activeNavItem == 'Contact'),
          ],
          color: Colors.black.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Color(0xFFD4A574).withOpacity(0.3),
            ), // Warm amber
          ),
        ),
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
              : Colors.transparent, // Warm amber
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive ? Color(0xFFD4A574) : Colors.white70, // Warm amber
          ),
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
                    color: Color(0xFFD4A574).withOpacity(0.3), // Warm amber
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
              : Colors.transparent, // Warm amber
          border: isActive
              ? Border.all(
                  color: Color(0xFFD4A574).withOpacity(0.4),
                  width: 1,
                ) // Warm amber
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

  Widget _buildMainContent(bool isMobile) {
    return Positioned(
      top: isMobile ? 120 : 180,
      left: isMobile ? 16 : 60,
      right: isMobile ? 16 : 60,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 20,
                  vertical: isMobile ? 6 : 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFD4A574).withOpacity(0.2), // Warm amber
                  border: Border.all(
                    color: Color(0xFFD4A574).withOpacity(0.4), // Warm amber
                    width: 1,
                  ),
                ),
                child: Text(
                  'Welcome to Ashish',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 12 : 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 16 : 30),

              // Main Heading - Responsive
              _buildMainHeading(isMobile),
              SizedBox(height: isMobile ? 16 : 30),

              // Subtitle - Responsive
              Container(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? double.infinity : 500,
                ),
                child: Text(
                  "Experience ancient wisdom through modern healthcare. Our certified Ayurvedic practitioners blend traditional healing methods with contemporary wellness approaches.",
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 12 : 14,
                    color: Colors.white70,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 24 : 50),

              // Add certified badge for mobile at bottom
              if (isMobile) ...[
                const SizedBox(height: 30),
                _buildMobileCertificationBadge(),
                const SizedBox(height: 12),

                // Phone Number with WhatsApp
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFF25D366).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        FontAwesomeIcons
                            .whatsapp, // Correct way to access WhatsApp icon
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

                // Email
                Text(
                  'info@ashishayurveda.com',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                // Address
                Text(
                  'Thiruvananthapuram, Kerala',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainHeading(bool isMobile) {
    final double fontSize = isMobile ? 28 : 64;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Discover the ",
            style: GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: "Power",
            style: GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A574), // Warm amber
              height: 1.1,
              shadows: [
                Shadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  color: Color(0xFFD4A574).withOpacity(0.5), // Warm amber
                ),
              ],
            ),
          ),
          TextSpan(
            text: " of\nAyurveda with Our\nTrusted ",
            style: GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1.1,
            ),
          ),
          TextSpan(
            text: "Experts",
            style: GoogleFonts.playfairDisplay(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD4A574), // Warm amber
              height: 1.1,
              shadows: [
                Shadow(
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  color: Color(0xFFD4A574).withOpacity(0.5), // Warm amber
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: _buildPrimaryButton(isMobile: true),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: _buildSecondaryButton(isMobile: true),
        ),
      ],
    );
  }

  Widget _buildDesktopButtons() {
    return Row(
      children: [
        _buildPrimaryButton(),
        const SizedBox(width: 20),
        _buildSecondaryButton(),
      ],
    );
  }

  Widget _buildPrimaryButton({bool isMobile = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFFD4A574), Color(0xFFB8865F)], // Warm amber gradient
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFFD4A574).withOpacity(0.4), // Warm amber
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
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 30,
            vertical: isMobile ? 12 : 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Book Consultation',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 14 : 16,
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

  Widget _buildSecondaryButton({bool isMobile = false}) {
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
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 30,
            vertical: isMobile ? 12 : 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
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
                fontSize: isMobile ? 14 : 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileCertificationBadge() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.1),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.verified,
              color: Color(0xFFD4A574),
              size: 14,
            ), // Warm amber
            const SizedBox(width: 6),
            Text(
              'Certified Ayurvedic Center',
              style: GoogleFonts.inter(
                fontSize: 10,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Certified Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
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

                // Phone Number with WhatsApp
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Color(0xFF25D366).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        FontAwesomeIcons
                            .whatsapp, // Correct way to access WhatsApp icon
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

                // Email
                Text(
                  'info@ashishayurveda.com',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),

                // Address
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
}
