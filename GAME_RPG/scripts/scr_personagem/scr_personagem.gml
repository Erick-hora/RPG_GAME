// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_colisao(){

if place_meeting(x + VelocH, y, obj_parede){
	while !place_meeting(x + sign(VelocH), y, obj_parede){
		x += sign(VelocH);	
	}
	VelocH = 0;
}
x+= VelocH;

if place_meeting(x, y + VelocV, obj_parede){
	while !place_meeting(x, y + sign(VelocV), obj_parede){
		y += sign(VelocV);	
	}
	VelocV = 0;
}

y+= VelocV;
	
	
}

function scr_personagem_andando(){
Direita = keyboard_check(ord("D"))
Esquerda =  keyboard_check(ord("A"))
Cima =  keyboard_check(ord("W"))
Baixo =  keyboard_check(ord("S"))

VelocH = (Direita - Esquerda);
VelocV = (Baixo - Cima);

Veloc_dir = point_direction(x, y, x + VelocH, y + VelocV);

if VelocH != 0 or VelocV != 0 { 
	Veloc = 2;
}else {
	Veloc = 0;
}


VelocH = lengthdir_x(Veloc, Veloc_dir);
VelocV = lengthdir_y(Veloc, Veloc_dir);

scr_personagem_colisao();


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
if Stamina > 10 {
if mouse_check_button_pressed(mb_right) {
	Stamina -= 10;
	alarm[1] = 100;
	alarm[0] = 8;
	Dash_dir = point_direction(x, y, mouse_x, mouse_y);
	estado = scr_personagem_dash;
		}
	}
if mouse_check_button_pressed(mb_left){
	image_index = 0;
switch dir {
	//direita
	default:
		sprite_index = spr_personagem_atacando_direita;
	break;
	//cima
	case 1:
		sprite_index = spr_personagem_atacando_cima;
	break;
	//esquerda
	case 2:
		sprite_index = spr_personagem_atacando_esquerda;
	break;
	//baixo
	case 3:
		sprite_index = spr_personagem_atacando_baixo;
	break;
	
		}	
		Estado = scr_personagem_atacando;
	}	
}


function scr_personagem_dash() {
	VelocH = lengthdir_x(dash_veloc, Dash_dir);
	VelocV = lengthdir_y(dash_veloc, Dash_dir);
	
	scr_personagem_colisao();
	
	var _inst = instance_create_layer(x, y, "instances", obj_dash);
	_inst.sprite_index = sprite_index;
}

function scr_personagem_atacando(){
	if image_index >= 1 {
	if atacar == false {
	switch dir {
	//direita
	default:
		instance_create_layer(x + 10, y, "instances", obj_personagem_hitbox);
	break;
	//cima
	case 1:
	instance_create_layer(x , y - 10, "instances", obj_personagem_hitbox);
	break;
	//esquerda
	case 2:
	instance_create_layer(x - 10, y, "instances", obj_personagem_hitbox);
	break;
	//baixo
	case 3:
		instance_create_layer(x, y + 10, "instances", obj_personagem_hitbox);
	break;
	}
	atacar = true;
	}	
	}
}