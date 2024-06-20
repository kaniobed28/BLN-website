import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // runApp(const MyApp());
}

class SomDescription extends StatelessWidget {
  const SomDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: screenSize.width * 0.4,
              height: screenSize.width * 0.4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.blue),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/blnlogo.jpg",
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    // width: 250, // Optional: Set width of the container
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 0, 0, 0), // Fill the container with blue color
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Optional: Add padding inside the container
                      child: Text(
                        'DESCRIPTION OF SOM',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors
                              .white, // Text color is white against blue background
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                      'Sermon On the Mount is the annual gathering of the people of God across the cities, regions, the nations of the world, and the continents of the globe unto the mountain of the LORD’S house.',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                      ' SOM is in line with an end time prophecy as prophesied in Micah 4:2 and Isaiah 2:2-5 when the LORD said, “and it shall come to pass in the last days that the mountain of the LORD’S house shall be established in the top of the mountains, and shall be exalted above the hills; and all the nations shall flow unto it. And many people shall go and say, Come ye and let’s go up to the mountain of the LORD, to the house of the God of Jacob; and he will teach us his ways, and we will walk in his paths: for out of Zion shall go forth the law, and the word of the LORD from Jerusalem. And he shall judge among the nations, and shall rebuke many people: and they shall beat their swords into plowshares, and their spears into pruning hooks: nation shall not lift up sword against nation, neither shall they learn war anymore. Oh house of Jacob, come ye, and let us walk in the light of the LORD.',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                      '1. Sermon On the Mount is a mountain of REVELATION and LIGHT, where God will reveal unto His people His ancient ways and give them light for dominion.',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                      '2. Sermon On the Mount is a mountain of DIRECTIONS and INSTRUCTIONS, where God will direct and instruct His people to walk after His ways and patterns.',
                      style:
                          GoogleFonts.lato(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                  '3. Sermon On The Mount is a mountain of JUDGEMENT, where God judges the matters of the saints and nations and brings verdict on darkness and Satan.',
                  style: GoogleFonts.lato(fontSize: 16, color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                  'Sermon On The Mount is also in alignment with the teachings of the Kingdom and its manifestation by the Lord Jesus Christ as revealed in the gospels. According to the gospels of Matthew, Mark, Luke, and John, Jesus camped the people of old for days as he taught and manifested the possibilities of the Kingdom of God. As such is what he does during Sermon On the Mount.',
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                  '1. Sermon On the Mount again is a mountain of the teaching of the kingdom as Jesus takes us through the deepness of the Kingdom of God in word and deed.',
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                  '2. Sermon On the Mount is a mountain of signs, wonders, and miracles. In Luke 6:17, 18, and 19, on the mountain, sicknesses were healed, oppressions were terminated, the dumb heard, the blind saw, dead raised back to life, and all manner of miracles did Jesus do. As such is what he does on the Sermon On The Mount.',
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  // width: 250, // Optional: Set width of the container
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Fill the container with blue color
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Optional: Add padding inside the container
                    child: Text(
                  'In summary, Sermon On The Mount is the Mountain of the LORD’S house where He becomes our God and we, His people, where He becomes our Father and we, His children.',
                  style: GoogleFonts.lato(fontSize: 16, color: Colors.white),
                ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
