/* 
    Domyos weight holder
        

   Copyright (c) 2020 Roman Hujer   http://hujer.net

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,ss
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.

  Description: 
  
     Domyos weight holder for EQ5 or others telescope mounts 
  

*/

use <threads.scad>
use <nuts_and_bolts.scad>





rod_dia = 20.5; //mm  EQ5
//rod_dia = 18.5; //mm  EQ6, GS280
//rod_dia = 12.5; //mm  Seben EQ3,  BRESSER EQ3 (Lidl Sope)

//Render

Holder = 1;
Nuts  = 1;
Knob = 1; 

if( Nuts == 1) {
     
    translate ([0, 0,50]) hex_nut (10, 29.3, 50,1, 1,1, "metric", 3);
}    


if ( Holder == 1) {
   difference() {
    union(){
     cylinder (h = 30, r=30 );
     translate ([0,0,30]) metric_thread (diameter=29, pitch=3, length=60, internal=false );
    }
    cylinder (h = 100, r=rod_dia/2 );
    translate ([17.5,0,10]) {
         rotate ([0,90,0] ){ hex_bolt (0, 0, 4.8, 8.2, 1/128, 100, 0, "metric" );  
         translate([0,0,-15]) cylinder (h = 30, r=5.4/2  );  }       
         translate([0,-8.2/2,-20])cube([4.8, 8.2, 20] );
     }
   }   
}

if ( Knob == 1) {

translate ([45,0,10]) rotate([0,-90,0])  
    
  difference() {
         
   union(){    
    cylinder (h = 10, r=15 );
    for (i =[0:5]) {
      rotate (60*i , [0,0,1] )  translate([13,0,0]) cylinder (h = 10, r=3.8 );
    }
   }
   union(){ 
    
    for (i =[0:5]) {
      rotate (60*i , [0,0,1] )  translate([0,15,0]) cylinder (h = 10, r=4.5 );
    }
        
    hex_bolt (0, 0, 4.5, 8.2, 1/128, 100, 0, "metric" );  
    
    cylinder (h = 20, r=2.7 );
   }
}

}