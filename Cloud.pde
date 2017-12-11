import java.util.Iterator;
import processing.sound.*;

class Cloud {
    PImage cloud;
    ArrayList<RainDrop> drops = new ArrayList<RainDrop>();
    PVector position;
    float speed = 0.6 + random(2);
    boolean day;
    int lastDropTime = 0;
    int dropDelay = 400;
    SoundFile thunder;
    float soundFading = 0;
    float soundFade = 0;
    
    Cloud(PApplet pApplet, String file, PVector position){
        this.position = position;
        day = true;
        cloud = loadImage(file);
        thunder = new SoundFile(pApplet, "thunder.wav");
    }
    
    void draw(){
        if(mouseX > position.x && mouseX < position.x + cloud.width && mouseY > position.y && mouseY < position.y + cloud.height){
            if(day){
                soundFading = 0.005;
                soundFade = 0;
                thunder.play(1, 0);
                thunder.jump((int) random(thunder.duration()));
            }
            day = false;
        } else{
            if(!day){
                soundFading = -0.01;
                soundFade = 0.5;
            }
            day = true;
        }
        tint(200);
        Iterator itr = drops.iterator();
        while(itr.hasNext()){
            RainDrop drop = (RainDrop) itr.next();
            drop.draw(itr);
        }
        if(day){
            tint(255);
        } else{
            tint(120);
            if(millis() - lastDropTime > dropDelay){
                lastDropTime = millis();
                dropDelay = 500 + (int) random(150);
                drops.add(new RainDrop(new PVector(position.x + random(cloud.width), position.y + cloud.height / 2), height));
            }
        }
        position.x += 1;
        if(position.x >= width){
            position.x = -cloud.width;
        }
        soundFade += soundFading;
        if(soundFade >= 0.5){
            soundFading = 0;
        } else if(soundFade <= 0){
            soundFading = 0;
            thunder.stop();
        }
        thunder.amp(soundFade);
        thunder.pan(map(position.x, 0, width, -1, 1));
        image(cloud, position.x, position.y);
    }
}