/// @description Insert description here
// You can write your code in this editor
other.vida -= obj_personagem.dano;

var _dir = point_direction(obj_personagem.x, obj_personagem.y, other.x, other.y);

other.empurrar_dir = _dir;
other.empurrar_veloc = 7;
other.Estado = scr_slime_hit;

other.alarm[1] = 5;
other.hit = true