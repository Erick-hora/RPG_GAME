// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slime_colisao(){
if place_meeting(x + VelocH, y, obj_parede){
	while !place_meeting(x + sign(VelocH), y, obj_parede){
		x += sign(VelocH);	
	}
	VelocH = 0;
}
x += VelocH;

if place_meeting(x, y + VelocV, obj_parede){
	while !place_meeting(x, y + sign(VelocV), obj_parede){
		y += sign(VelocV);	
	}
	VelocV = 0;
}
y += VelocV;
}

function scr_slime_checar_personagem () {
	if distance_to_object(obj_personagem) <= Dist_aggro{
		Estado = scr_slime_perserguir; 	
	}
}

function scr_slime_escolher_estado(){
	scr_slime_checar_personagem();
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
	scr_slime_checar_personagem();
	image_speed = 0.5;
}

function scr_slime_andando(){
	image_speed = 1;
	scr_slime_checar_personagem();
	if distance_to_point(Dest_x, Dest_y) > Veloc {
	var _dir = point_direction(x, y, Dest_x, Dest_y);
	VelocH = lengthdir_x(Veloc, _dir);
	VelocV = lengthdir_y(Veloc, _dir);
	
	scr_slime_colisao();
	} 
	else {
		x = Dest_x;
		y = Dest_y;
	}
}

function scr_slime_perserguir() {
	image_speed = 2;
	
	Dest_x = obj_personagem.x;
	Dest_y = obj_personagem.y;
	
	var _dir = point_direction(x, y, Dest_x, Dest_y);
	VelocH = lengthdir_x(Veloc_Perse, _dir);
	VelocV = lengthdir_y(Veloc_Perse, _dir);
	
	scr_slime_colisao();
	
	if distance_to_object(obj_personagem) >= Dist_desaggro {
	Estado = scr_slime_escolher_estado;
	alarm[0] = irandom_range(120, 240);
	}
}