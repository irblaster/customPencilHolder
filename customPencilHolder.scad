
myword = "ANGELINA";
myfont = "Liberation Sans Narrow:style=Bold";
fontsize = 24;
wordlen = len(myword);


use <fontmetrics.scad>;
textLength = measureText(myword, myfont, fontsize, spacing=1);

totalLength = textLength + 4.3*wordlen;

difference() {
    union() {
    
         translate([0,1,0])
          {
            linear_extrude( height = 14 ){
    
                    
            text(
               text = myword, 
               font = myfont, 
               size = fontsize, 
               spacing = 1
            );
          
         }
        }


    cube([totalLength, fontsize+2,12],false);
  }
  
  radius = 4.8;
  imaginaryExtra = 2*(20-(2*radius));
  
  numberHoles = floor((totalLength+6)/20);
  extraSpace = (totalLength+imaginaryExtra)-(20*numberHoles);
  startSpace = extraSpace/2;
  
  
   union() {
      
       //for (i=[12:20:totalLength-3]) {
  
        for (i=[0:numberHoles-1]) {
  
        translate([i*20+startSpace,fontsize+2,6])
         {
           rotate([90,0,0])
           {
             cylinder(h=fontsize, r=radius, center=false);
           }
         }

  }
}
}
    


 
 
 