/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_sprite(spr_sombra, 0, x, y + 4)
draw_self();

if alarm[3] > 0 {
	if image_alpha >= 1 {
		danoalpha = -0.05;
	} else if image_alpha <= 0 {
		danoalpha = 0.05;
	}
	image_alpha += danoalpha;
} else{
	
image_alpha = 1;

}