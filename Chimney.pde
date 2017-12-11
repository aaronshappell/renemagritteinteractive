import processing.sound.*;

class Chimney {
    PVector position;
    ParticleSystem smoke;
    SoundFile fire;
    boolean day;
    
    Chimney(PApplet pApplet, PVector position){
        this.position = position;
        smoke = new ParticleSystem(0, position, loadImage("smoke.png"));
        fire = new SoundFile(pApplet, "fire.wav");
        day = false;
    }
    
    void draw(){
        if(mouseX > position.x - 35 && mouseX < position.x + 100 && mouseY > position.y && mouseY < position.y + 120){
            if(day){
                fire.stop();
            }
            day = false;
        } else{
            if(!day){
                fire.loop(1, 2);
                fire.pan(map(position.x, 0, width, -1, 1));
            }
            day = true;
        }
        smoke.draw();
        smoke.applyForce(new PVector(0.05, -0.07).mult(0.2));
        if(day){
            for(int i = 0; i < 2; i++){
                smoke.addParticle();
            }
        }
    }
}