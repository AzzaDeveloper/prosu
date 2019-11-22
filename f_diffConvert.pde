float hp = 0.0f;
float cs = 0.0f;
float od = 0.0f;
float ar = 0.0f;

void diffConvert() {
    cs = (displayWidth/16)*(1-(0.7*(cs-5)/5));

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
    println("cs: "+cs);
    hitcircle.resize(cs, 0);
    hitcircleoverlay.resize(cs, 0);
    approachcircle.resize(cs, 0);
}