import processing.sound.*;

class Lamp {
    PImage lamp;
    PVector position;
    boolean day;
    SoundFile[] on = new SoundFile[2];
    SoundFile[] off = new SoundFile[2];
    SoundFile[] lampKnock = new SoundFile[3];
    
    Lamp(PApplet pApplet, String file, PVector position){
        lamp = loadImage(file);
        this.position = position;
        day = true;
        on[0] = new SoundFile(pApplet, "on1.wav");
        on[1] = new SoundFile(pApplet, "on2.wav");
        off[0] = new SoundFile(pApplet, "off1.wav");
        off[1] = new SoundFile(pApplet, "off2.wav");
        lampKnock[0] = new SoundFile(pApplet, "lampKnock1.wav");
        lampKnock[1] = new SoundFile(pApplet, "lampKnock2.wav");
        lampKnock[2] = new SoundFile(pApplet, "lampKnock3.wav");
    }
    
    void draw(){
        if(mouseX > position.x + lamp.width / 2 - 20 && mouseX < position.x + lamp.width / 2 + 25 && mouseY > position.y + 50 && mouseY < position.y + lamp.height - 70){
            if(day){
                SoundFile sound = off[(int) random(off.length)];
                sound.play();
                sound.pan(map(position.x, 0, width, -1, 1));
            }
            day = false;
        } else{
            if(!day){
                SoundFile sound = on[(int) random(on.length)];
                sound.play();
                sound.pan(map(position.x, 0, width, -1, 1));
            }
            day = true;
        }
        if(day){
            image(lamp, position.x, position.y);
        }
    }
    
    void mousePressed(){
        if(mouseX > position.x + lamp.width / 2 - 20 && mouseX < position.x + lamp.width / 2 + 25 && mouseY > position.y + 50 && mouseY < position.y + lamp.height - 70){
            SoundFile sound = lampKnock[(int) random(lampKnock.length)];
            sound.play(1, 0.5);
            sound.pan(map(mouseX, 0, width, -1, 1));
        }
    }
}