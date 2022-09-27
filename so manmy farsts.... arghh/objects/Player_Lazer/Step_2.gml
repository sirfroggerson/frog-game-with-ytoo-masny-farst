if Player.image_xscale = 1 {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	image_xscale = 1
	x = Player.x-12
}

if Player.image_xscale = -1 {
	image_angle = point_direction(-x, -y, -mouse_x, -mouse_y);
	image_xscale = -1
	x = Player.x+12
}
#region //GUN GUN GUN I LOVE GUN AM<ERICA_______________________
if Player.sprite_index = S_Idle {
	if Player.image_index = 0 
		y = Player.y + 26
	if Player.image_index = 1
		y = Player.y + 26
	if Player.image_index = 2
		y = Player.y + 34
	if Player.image_index = 3
		y = Player.y + 30
	if Player.image_index = 4
		y = Player.y + 26
}
#endregion

