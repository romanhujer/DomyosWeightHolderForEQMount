
use <threads.scad>
use <nuts_and_bolts.scad>

    

  difference() {
         
   union(){    
    cylinder (h = 12.5, r=19 );
   }
   union(){ 
    
   for (i =[0:5]) {
      rotate (60*i , [0,0,1] ) translate([0,20,-0.5]) cylinder (h = 19, r=6.5);
   }
        
    hex_bolt (0, 0, 10, 19, 1/128, 100, 0, "metric" );  
    
    cylinder (h = 15, r=6.1 );
   }
}
    for (i =[0:5]) {
      rotate (60*i , [0,0,1] )  translate([16,0,0]) cylinder (h = 12.5, r=5 );
    }

