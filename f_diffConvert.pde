float hp = 0.0f;
float cs = 0.0f;
float od = 0.0f;
float ar = 0.0f;

void diffConvert() {
    cs = (width/16)*(1-(0.7*(cs-5)/5))*2;

    if (ar < 5) {
        ar = 1600 + ((5 - ar) * 160);
    } else if (ar == 5) {
        ar = 1600;
    } else if (ar > 5) {
        ar = 1600 - ((ar - 5) * 200);
    }

    if (od < 5) {
        od = 66 - ((5 - od) * 8);
    } else if (od == 5) {
        od = 66;
    } else if (od > 5) {
        od = 66 - ((od - 5) * 8);
    }
    hitcircle.resize(int(cs), 0);
    hitcircleoverlay.resize(int(cs), 0);
    approachcircle.resize(int(cs), 0);
    for (int i = 0; i <= 9; i++) {
        //load the combo numbers
        combonum[i] = loadImage("./skin/default-"+ str(i) + ".png");
        //resize combonumber to osu standard (0.8x)
        combonum[i].resize(int(0.8 * (cs / 2)), 0);
    }
}