// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_escolher_estado(){
	Prox_estado = choose(scr_slime_andando, scr_slime_parado);
	
	if Prox_estado == scr_slime_andando {
		
		Estado = scr_slime_andando;
		Dest_x = irandom_range(0, room_width);
		Dest_y = irandom_range(0, room_height);
		
	} else if Prox_estado == scr_slime_parado {
		
		Estado = scr_slime_parado;
		
	}
	
}

function scr_slime_parado(){
	image_speed = 0.5;
}

function scr_slime_andando(){
	image_speed = 1;
	
	var _dir = point_direction(x, y, Dest_x, Dest_y);
	VelocH = lengthdir_x(Veloc, _dir);
	VelocV = lengthdir_y(Veloc, _dir);
	
	x += VelocH;
	y += VelocV;
}