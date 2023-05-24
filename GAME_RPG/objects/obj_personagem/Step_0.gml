/// @description Insert description here
// Moviemntação
Direita = keyboard_check(ord("D"))
Esquerda =  keyboard_check(ord("A"))
Cima =  keyboard_check(ord("W"))
Baixo =  keyboard_check(ord("S"))

VelocV = (Baixo - Cima) * Veloc;

VelocH = (Direita - Esquerda) * Veloc;

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