import processing.sound.*;

class Window {
    PImage window;
    PVector position;
    boolean day;
    SoundFile[] on = new SoundFile[2];
    SoundFile[] off = new SoundFile[2];
    SoundFile[] knock = new SoundFile[3];
    
    Window(PApplet pApplet, String file, PVector position){
        window = loadImage(file);
        this.position = position;
        day = true;
        on[0] = new SoundFile(pApplet, "on1.wav");
        on[1] = new SoundFile(pApplet, "on2.wav");
        off[0] = new SoundFile(pApplet, "off1.wav");
        off[1] = new SoundFile(pApplet, "off2.wav");
        knock[0] = new SoundFile(pApplet, "windowKnock1.wav");
        knock[1] = new SoundFile(pApplet, "windowKnock2.wav");
        knock[2] = new SoundFile(pApplet, "windowKnock3.wav");
    }
    
    void draw(){
        if(mouseX > position.x && mouseX < position.x + window.width && mouseY > position.y && mouseY < position.y + window.height){
            if(day){
                SoundFile sound = off[(int) random(off.length)];
                sound.play();
                sound.pan(map(position.x, 0, width, -1, 1));
            }
            day = false;
        } else{
            if(!day){
                SoundFile sound = off[(int) random(off.length)];
                sound.play();
                sound.pan(map(position.x, 0, width, -1, 1));
            }
            day = true;
        }
        if(day){
            tint(255);
        } else{
            tint(120);
        }
        image(window, position.x, position.y);
    }
    
    void mousePressed(){
        if(mouseX > position.x && mouseX < position.x + window.width && mouseY > position.y && mouseY < position.y + window.height){
            SoundFile sound = knock[(int) random(knock.length)];
            sound.play(1, 0.5);
            sound.pan(map(mouseX, 0, width, -1, 1));
        }
    }
}