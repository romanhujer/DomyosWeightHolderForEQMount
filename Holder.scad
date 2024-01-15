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

//Set Rod diametr 20.5 mm  EQ5 (default), 18.5 mm  EQ6 (NEQ6)or GS280 or 12.5 mm for  Seben EQ3 or  BRESSER EQ3 (Lidl Sope)
Rod_dia = 12.4;

//Weigh Therd diameter  (disk hole) default is 29 mm for  Domyos weight disk
Weigh_Thred_dia = 29; 

//Weigh Therd long {default is 60 mm)
Weigh_Thred_long = 60;

//Weigh Therd pitch {default is 3 mm)
Weigh_Thred_pitch = 3;


// Render model select (for export to .stl  select only one model)  1 = enable  0 = disable render
Holder = 1;
Nuts  = 0;
Knob = 0; 

module M12_dira_a(){
 
 rv2=19;
 hm = 10;
    
 union(){  
  cylinder(h=hm, r=rv2/sqrt(3), center=true, $fn=6);
  translate([10,0,0 ])cube([20,rv2,hm], center=true);
  cylinder(h=32, r=4.2, center=true, $fn=360);
 }
}


if( Nuts == 1) {
     
    translate ([0, 0,50]) hex_nut (10, Weigh_Thred_dia + 0.3, 50,1, 1,1, "metric", Weigh_Thred_pitch);
}    


if ( Holder == 1) {
   difference() {
    union(){
     cylinder (h = 40, r=20 );
     translate ([0,0,40]) metric_thread (diameter=Weigh_Thred_dia, pitch=Weigh_Thred_pitch, length=Weigh_Thred_long, internal=false );
    }
    union(){
     cylinder (h = Weigh_Thred_long+40, r=Rod_dia/2 );
     translate ([0,0,18]) M12_dira_a();
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