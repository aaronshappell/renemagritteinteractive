import java.util.Iterator;

class RainDrop {
    String[] files = {"drop1.png", "drop2.png", "drop3.png", "drop4.png"};
    PImage manDrop;
    PVector initialPosition;
    PVector position;
    float fallHeight;
    float speed = 3 + random(2);
    
    RainDrop(PVector position, float fallHeight){
        this.initialPosition = position.copy();
        this.position = position;
        this.fallHeight = fallHeight;
        manDrop = loadImage(files[(int) random(files.length)]);
    }
    
    void draw(Iterator itr){
        position.y += speed;
        if(position.y - initialPosition.y >= fallHeight){
            itr.remove();
        }
        image(manDrop, position.x, position.y);
    }
}