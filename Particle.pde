class Particle {
    PVector pos;
    PVector vel;
    PVector acc;
    float lifespan;
    PImage image;
    float tint = (int) (180 + random(75));
    
    Particle(PVector pos, PImage image){
        acc = new PVector(0, 0);
        vel = new PVector(randomGaussian(), -randomGaussian());
        vel.mult(0.2);
        this.pos = pos.copy();
        this.image = image;
        lifespan = 500;
    }
    
    void applyForce(PVector force){
        acc.add(force);
    }
    
    void draw(){
        vel.add(acc);
        pos.add(vel);
        lifespan -= 2.5;
        acc.mult(0);
        tint(tint, lifespan);
        image(image, pos.x, pos.y);
    }
    
    boolean isDead(){
        return lifespan <= 0;
    }
}