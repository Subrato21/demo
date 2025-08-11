import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationDetails extends StatelessWidget {
  const LocationDetails({super.key});

  // layout constants only (no style changes)
  static const double imageHeight = 300;
  static const double cardRadius = 26;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      body: Stack(
        children: [
          // Fill viewport so the card can extend to the bottom
          SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                // Top Image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    'https://picsum.photos/id/1015/500/300', // Replace
                    width: double.infinity,
                    height: imageHeight,
                    fit: BoxFit.cover,
                  ),
                ),

                // Top buttons
                Positioned(
                  top: 59,
                  left: 26,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 43,
                      height: 43,
                      padding:
                          const EdgeInsets.all(12), // padding inside circle
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(100)), // fully round
                      ),
                      child: Image.asset(
                        'assets/images/Vector.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 59,
                  left: 317,
                  child: InkWell(
                    onTap: () {
                      // favorite button tap action here
                    },
                    child: Container(
                      width: 43,
                      height: 43,
                      padding:
                          const EdgeInsets.all(12), // padding inside circle
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(100)), // fully round
                      ),
                      child: Image.asset(
                        'assets/images/love.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // White content card from image bottom to screen bottom
                Positioned.fill(
                  top: imageHeight - cardRadius,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(cardRadius),
                      topRight: Radius.circular(cardRadius),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        children: [
                          // Scrollable content (ALL original styles/paddings preserved)
                          SingleChildScrollView(
                            padding: const EdgeInsets.all(16)
                                .copyWith(bottom: 120 + bottomInset),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  "Koh Mook",
                                  style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 4),

                                // Location
                                Row(
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                          'assets/images/location 03.png'),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Trang, Thailand",
                                      style: GoogleFonts.kanit(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF636773)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),

                                // Rating
                                Row(
                                  children: [
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          child: Icon(
                                            index < 4
                                                ? Icons.star
                                                : Icons.star_half,
                                            color: const Color(0xFF2894D1),
                                            size: 13.5,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "4.5",
                                      style: GoogleFonts.kanit(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF2894D1)),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Details Heading
                                Text(
                                  "Details",
                                  style: GoogleFonts.kanit(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 8),

                                // Details Text (cleaner like the mock)
                                Text(
                                  'The third largest island in the Trang Sea is Koh Muk, '
                                  'which is beautiful and peaceful like a private island. '
                                  'On the island, there will be villagers living as well, '
                                  'maintaining a simple way of life. In most cases, tourists '
                                  'would like to visit Farang Beach and Sabai Beach, and these '
                                  'two beaches have different types of popular travel.\n\n'
                                  'As for Farang Beach, it is a beach with accommodation lined '
                                  'up on a beautiful white sandy ground. It is also a point '
                                  'where there will be various tour services. The sand is '
                                  'beautiful white and the atmosphere is quiet, perfect for '
                                  'sunbathing — including another highlight of Koh Mook.',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    height:
                                        1.5, // line height similar to reference
                                    color: const Color(0xFF636773),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),

                                const SizedBox(height: 16),
                                Text(
                                  'As for Sabai Beach, it offers a slightly different vibe '
                                  'with calmer waters and fewer crowds, making it ideal for '
                                  'relaxed afternoons and long walks along the shore.',
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    height: 1.5,
                                    color: const Color(0xFF636773),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Soft gradient so text fades under the button
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: IgnorePointer(
                              child: Container(
                                height: 96 + bottomInset,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.white.withOpacity(0.0),
                                      Colors.white.withOpacity(0.7),
                                      Colors.white,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Sticky bottom button
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 14 + bottomInset,
                            child: SizedBox(
                              height: 52,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2894D1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Find a place to stay",
                                  style: GoogleFonts.kanit(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
