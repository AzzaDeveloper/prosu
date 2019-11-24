ArrayList<Circle> circles = new ArrayList<Circle>(); // Array to store circles
int counter = 0; // Circles counter
// Read the .osu file
void readfile(String[] lines, String path) {
    String audio = lines[3]; //get the audio file name
    // if not empty get the name of the audio file
    if (audio.length() >= 15) {
        audio = audio.substring(15, lines[3].length());
    } else {
        audio = "audio.mp3"; //default to audio.mp3 if name is empty
    }
    //run through every lines in the file
    for (int i = 0; i <= lines.length; i++) {
        //find [Metadata] values
        if (lines[i].equals("[Metadata]")) {
            i++;
            String title = "";
            String artist= "";
            String difficulty = "";
            // if found line break then stop
            while (!lines[i].equals("")) {
                String[] line = lines[i].split(":");
                // Get title
                if (line[0].equals("Title")) {
                    title = line[1];
                }
                // Get artist
                if (line[0].equals("Artist")) {
                    artist = line[1];
                }
                // Get version
                if (line[0].equals("Version")) {
                    difficulty = line[1];
                }
                i++;
            }
            surface.setTitle(artist + " - " + title + " [" + difficulty + "]");
        }
        // find [Difficulty] values
        if (lines[i].equals("[Difficulty]")) {
            i++;
            while (!lines[i].equals("")) {
                String[] line = lines[i].split(":");
                // Get hp
                if (line[0].equals("HPDrainRate")) {
                    hp = int(line[1]);
                }
                // Get cs
                if (line[0].equals("CircleSize")) {
                    cs = int(line[1]);
                }
                // Get od
                if (line[0].equals("OverallDifficulty")) {
                    od = int(line[1]);
                }
                // Get ar
                if (line[0].equals("ApproachRate")) {
                    ar = int(line[1]);
                }
                // If not found ar then od = ar (Old .osu compatability )
                if (lines[i+1].equals("")) {
                    if (ar == 0) {
                        ar = od;
                    }
                }
                i++;
            }
            diffConvert();
        }
        // If found [HitObjects] then read the rest of the lines in the file and push them into circles
        if (lines[i].equals("[HitObjects]")) {
            for (int n = i + 1; n < lines.length; n++) {
                //Reading the HitObjects parameters (separated by ,)
                String[] params = split(lines[n],  ",");
                // Adding circles to the the Array 
                Circle hit = new Circle(int(params[0]), int(params[1]), int(params[2]), int(params[3]));
                circles.add(hit);
                counter++;  
            }
            //Breaking the for loop since we already went through the hit circles
            break;
        }
    }
    //play the audio
    player = minim.loadFile(path + "/" + audio);
    player.play();
}
int loadSong(String path) {
    // Retrieve all files in oath
    File[] filenames = listFiles(path);
    for (int i = 0; i <= filenames.length; i++) {
        int length = filenames[i].getName().length();
        // if file ends with osu
        if (filenames[i].getName().substring(length - 4, length).equals(".osu")) {
            String[] lines = loadStrings(filenames[i].getAbsolutePath());
            //read the osu file
            readfile(lines, path);
            return 0;
        }
    }
    // returns the error code
    return 1;
}