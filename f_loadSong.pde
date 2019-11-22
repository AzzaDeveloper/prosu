ArrayList<Circle> circles = new ArrayList<Circle>(); // Array to store circles
int counter = 0; // Circles counter
// Read the .osu file
void readfile(String[] lines, String path) {
    //get the audio file name
    String audio = lines[3];
    // if not empty get the name 
    if (audio.length() >= 15) {
        audio = audio.substring(15, lines[3].length());
    } else {
        //default to audio.mp3 if name is empty
        audio = "audio.mp3";
    }
    //run through every lines in the file
    for (int i = 0; i <= lines.length; i++) {
        //find [Metadata] values
        
        if (lines[i].equals("[Metadata]")) {
            String title;
            String artist;
            String difficulty;
            // if found line break then stop
            while (!lines[i].equals("")) {
                // Get title
                if (lines[i].split(":")[0].equals("Title")) {
                    title = lines[i].split(":")[1];
                }
                // Get artist
                if (lines[i].split(":")[0].equals("Artist")) {
                    artist = lines[i].split(":")[1];
                }
                // Get version
                if (lines[i].split(":")[0].equals("Version")) {
                    difficulty = lines[i].split(":")[1];
                }
                i++;
            }
        }
        // find [Difficulty] values

        if (lines[i].equals("[Difficulty]")) {
            int hp = 0;
            int cs = 0;
            int od = 0;
            int ar = 0;
            while (!lines[i].equals("")) {
                // Get hp
                if (lines[i].split(":")[0].equals("HPDrainRate")) {
                    hp = int(lines[i].split(":")[1]);
                }
                // Get cs
                if (lines[i].split(":")[0].equals("CircleSize")) {
                    cs = int(lines[i].split(":")[1]);
                }
                // Get od
                if (lines[i].split(":")[0].equals("OverallDifficulty")) {
                    od = int(lines[i].split(":")[1]);
                }
                // Get ar
                if (lines[i].split(":")[0].equals("ApproachRate")) {
                    ar = int(lines[i].split(":")[1]);
                }
                // If not found ar then od = ar (Old .osu compatability )
                if (lines[i+1].equals("")) {
                    if (ar == 0) {
                        ar = od;
                    }
                }
                i++;
                
            }
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
	player.setGain(-5);
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
    //Audio control
    // return the error code
    return 1;
}