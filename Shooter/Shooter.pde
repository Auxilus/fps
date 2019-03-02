import java.util.Map;

//player location and view
PVector player_pos = new PVector(0.0, 0.0);
PVector player_view = new PVector(0.0, 0.0);
float angle = 0;
int bulletlimit = 0;

HashMap<Character, Integer> hm = new HashMap<Character, Integer>();

//bullets
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void setup() {
  size(600, 600);
  stroke(255);
  strokeWeight(6);
  hm.put('a', 0);
  hm.put('w', 0);
  hm.put('s', 0);
  hm.put('d', 0);
  hm.put('e', 0);
  hm.put('q', 0);
  hm.put('f', 0);

  //spawn player at the center
  player_pos.x = width/2;
  player_pos.y = height/2;
}

void draw() {
  background(0);
  strokeWeight(8);
  bulletlimit += 1;
  for (Map.Entry me : hm.entrySet()) {
    if ((int)me.getValue() == 1) {
      parse_keys((char)me.getKey());
    }
  }
  //player
  point(player_pos.x, player_pos.y);

  //player view direction
  strokeWeight(2);
  player_view.x = cos(angle)*15 + player_pos.x;
  player_view.y = sin(angle)*15 + player_pos.y;
  line(player_pos.x, player_pos.y, player_view.x, player_view.y);

  //draw bullets if any present
  if (bullets.size() > 0) {
    for (int i = 0; i < bullets.size(); i++) {
      //remove the bullet if its out of bounds or else render it
      if (bullets.get(i).pos.x < 0 ||
        bullets.get(i).pos.x > height ||
        bullets.get(i).pos.y < 0 ||
        bullets.get(i).pos.y > width) {
        bullets.remove(i);
        println("bullet "+i+" removed");
      } else {
        strokeWeight(2);
        point(bullets.get(i).pos.x, bullets.get(i).pos.y);
        bullets.get(i).update();
      }
    }
  }
}

//keyboard inout parser
void keyPressed() {
  switch(key) {                                                                           
  case 'w':
    hm.put('w', 1);                                       
    break;
  case 's':  
    hm.put('s', 1);                                          
    break;                                                                                
  case 'a':
    hm.put('a', 1);                                          
    break;                                                                                
  case 'd':
    hm.put('d', 1);
    break;                                                                                
  case 'q':
    hm.put('q', 1);                                                   
    break;                                                                                
  case 'e':                                                                                 
    hm.put('e', 1);                                                    
    break;
  case 'f':
    hm.put('f', 1);
    break;
  }
}

void keyReleased() {
  switch(key) {                                                                           
  case 'w':
    hm.put('w', 0);                                       
    break;
  case 's':  
    hm.put('s', 0);                                          
    break;                                                                                
  case 'a':
    hm.put('a', 0);                                          
    break;                                                                                
  case 'd':
    hm.put('d', 0);
    break;                                                                                
  case 'q':
    hm.put('q', 0);                                                   
    break;                                                                                
  case 'e':                                                                                 
    hm.put('e', 0);                                                    
    break;
  case 'f':
    hm.put('f', 0);
    break;
  }
}

void parse_keys(char k) {
  switch(k) {                                                                           
  case 'w':
    player_pos.x = player_pos.x + cos(angle) * 2;
    player_pos.y = player_pos.y + sin(angle) * 2;                                           
    break;
  case 's':  
    player_pos.x = player_pos.x - cos(angle) * 2;                                           
    player_pos.y = player_pos.y - sin(angle) * 2;                                           
    break;                                                                                
  case 'a':
    player_pos.x = player_pos.x + sin(angle) * 2;                                           
    player_pos.y = player_pos.y - cos(angle) * 2;                                           
    break;                                                                                
  case 'd':
    player_pos.x = player_pos.x - sin(angle) * 2;
    player_pos.y = player_pos.y + cos(angle) * 2;
    break;                                                                                
  case 'q':
    angle -= 0.1;                                                                           
    break;                                                                                
  case 'e':                                                                                 
    angle += 0.1;                                                                           
    break;
  case 'f':
    if (bulletlimit >= 10) {
      println("bullet "+bullets.size()+" added");
      bullets.add(new Bullet(player_pos.x, player_pos.y, player_view.x, player_view.y));
      bulletlimit = 0;
    }
    break;
  }
}

void mousePressed() {
  hm.put('f', 1);
}

void mouseReleased() {
  hm.put('f', 0);
}
