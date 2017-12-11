import java.util.Iterator;

class ParticleSystem {
    ArrayList<Particle> particles;
    PVector origin;
    PImage image;
    
    ParticleSystem(int num, PVector origin, PImage image){
        this.particles = new ArrayList<Particle>();
        this.origin = origin;
        this.image = image;
        for(int i = 0; i < num; i++){
            particles.add(new Particle(origin, image));
        }
    }
    
    void draw(){
        Iterator<Particle> itr = particles.iterator();
        while(itr.hasNext()){
            Particle particle = itr.next();
            particle.draw();
            if(particle.isDead()){
                itr.remove();
            }
        }
    }
    
    void applyForce(PVector force){
        for(Particle particle : particles){
            particle.applyForce(force);
        }
    }
    
    void addParticle(){
        particles.add(new Particle(origin, image));
    }
}