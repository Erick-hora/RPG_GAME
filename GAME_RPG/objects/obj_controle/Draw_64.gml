/// @description Inserir descrição aqui
var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = obj_personagem.vida;
var _maxvida = obj_personagem.vida_max;
var _estamina = obj_personagem.Stamina;
var _maxestamina = obj_personagem.Max_stamina;


//vida
draw_sprite_ext(spr_hud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);

//estamina
draw_sprite_ext(spr_hud_barra_estamina, 0, 0, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1);

//hud
draw_sprite_ext(spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);
