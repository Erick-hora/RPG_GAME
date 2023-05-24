/// @description Insert description here
// You can write your code in this editor
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