// Read the .osu file
void readfile(String[] lines) {
    //Run through everyline in the file
    for (int i = 0; i < lines.length; i++) {
        println(lines[i]);
        if (lines[i].equals("[Metadata]")) {
            String artist = lines[i + 3].substring(7, lines[i + 3].length());
            String title = lines[i + 1].substring(6, lines[i + 1].length());
            String difficulty = lines[i + 6].substring(8, lines[i + 6].length());
            frame.setTitle(artist + " - " + title + " [" + difficulty + "]");
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
}
int loadSong(String path) {
    minim = new Minim(this);
    player = minim.loadFile(path + "/audio.mp3");
	player.setGain(-10);
    player.play();
    // Retrieve all files in oath
    File[] filenames = listFiles(path);
    //variable to store in content of .osu
    for (int i = 0; i < filenames.length; i++) {
        int length = filenames[i].getName().length();
        // if file ends with osu
        if (filenames[i].getName().substring(length - 4, length).equals(".osu")) {
            String[] lines = loadStrings(filenames[i].getAbsolutePath());
            readfile(lines);
        }
    }
    //Audio control
    // return the error code
    return 0;
}