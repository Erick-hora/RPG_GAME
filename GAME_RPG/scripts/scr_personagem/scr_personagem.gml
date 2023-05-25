// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_andando(){
	Direita = keyboard_check(ord("D"))
Esquerda =  keyboard_check(ord("A"))
Cima =  keyboard_check(ord("W"))
Baixo =  keyboard_check(ord("S"))

VelocH = (Direita - Esquerda) * Veloc;

if place_meeting(x + VelocH, y, obj_parede){
	while !place_meeting(x + sign(VelocH), y, obj_parede){
		x += sign(VelocH);	
	}
	VelocH = 0;
}
x+= VelocH;


VelocV = (Baixo - Cima) * Veloc;

if place_meeting(x, y + VelocV, obj_parede){
	while !place_meeting(x, y + sign(VelocV), obj_parede){
		y += sign(VelocV);	
	}
	VelocV = 0;
}

y+= VelocV;


//Mudança de sprite
dir = floor((point_direction(x, y, mouse_x, mouse_y)+ 45)/90);

if VelocH == 0 and VelocV = 0 { 
switch dir{
		default:
		
		sprite_index = spr_personagem_parado_direita;
	
	break;
	
		case 1:
		sprite_index = spr_personagem_parado_cima;
	
	break;
	
		case 2:
		sprite_index = spr_personagem_parado_esquerda;
	
	break;
	
		case 3: 
		sprite_index = spr_personagem_parado_baixo;
	
	break;
}

}  else {
	
switch dir{
	
		default:
		
		sprite_index = spr_personagem_correndo_direita;
	
	break;
	
		case 1:
		sprite_index = spr_personagem_correndo_cima;
	
	break;
	
		case 2:
		sprite_index = spr_personagem_correndo_esquerda;
	
	break;
	
		case 3: 
		sprite_index = spr_personagem_correndo_baixo;
	
	break;
	}

}

if mouse_check_button_pressed(mb_right) {
	alarm[0] = 8;
	Dash_dir = point_direction(x, y, mouse_x, mouse_y);
	estado = scr_personagem_dash;
	}
}


function scr_personagem_dash() {
	VelocH = lengthdir_x(dash_veloc, Dash_dir);
	VelocV = lengthdir_y(dash_veloc, Dash_dir);
	x += VelocH;
	y += VelocV;
	var _inst = instance_create_layer(x, y, "instances", obj_dash);
	_inst.sprite_index = sprite_index;
}