ArrayList<Circle> circles = new ArrayList<Circle>(); // Array to store circles
int counter = 0; // Circles counter
// Read the .osu file
void readfile(String[] lines, String path) {
    //Run through everyline in the file
    String audio = lines[3];
    if (audio.length() >= 15) {
        audio = audio.substring(15, lines[3].length());
    } else {
        audio = "audio.mp3";
    }
    for (int i = 0; i < lines.length; i++) {
        if (lines[i].equals("[Metadata]")) {
            String artist = lines[i + 3].substring(7, lines[i + 3].length());
            String title = lines[i + 1].substring(6, lines[i + 1].length());
            String difficulty = lines[i + 6].substring(8, lines[i + 6].length());
            surface.setTitle(artist + " - " + title + " [" + difficulty + "]");
            // skip through the rest of the metadata
            i += 11;
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
            //Breaking the for loop since we already went through the hit cirlces
            break;
        }
    }
    minim = new Minim(this);
    player = minim.loadFile(path + "/" + audio);
	player.setGain(-5);
    player.play();
}
int loadSong(String path) {
    // Retrieve all files in oath
    File[] filenames = listFiles(path);
    for (int i = 0; i < filenames.length; i++) {
        int length = filenames[i].getName().length();
        // if file ends with osu
        if (filenames[i].getName().substring(length - 4, length).equals(".osu")) {
            String[] lines = loadStrings(filenames[i].getAbsolutePath());
            readfile(lines, path);
            return 0;
        }
    }
    //Audio control
    // return the error code
    return 1;
}