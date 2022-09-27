// _______________________________ restart game when press r lol!!!!!!!!
if keyboard_check_pressed(ord("R"))
    {
    game_restart();
    }

#region//____________________ accelerate right/max speed

if keyboard_check(ord("D")) {
	image_xscale = 1
	Xspeed = min(Xspeed + acclrt, spd);
}
//____________________ accelerate left/max speed
if keyboard_check(ord("A")) {
	image_xscale = -1
	Xspeed = max(Xspeed - acclrt, -spd)
}
#endregion

#region// ___________________ deecelerate from left and right
if Xspeed < 0 and !keyboard_check(ord("A")) and !keyboard_check(ord("D"))
	Xspeed = min(Xspeed + dcclrt, 0)

if Xspeed > 0 and !keyboard_check(ord("A")) and !keyboard_check(ord("D"))
	Xspeed = max(Xspeed - dcclrt, 0)
#endregion

#region//_________________________JUMP
//if place_meeting(x, y + 1, O_Grass) and keyboard_check_pressed(vk_space)
//	Yspeed = -jmpforce;

if place_meeting(x, y + 1, O_Grass)
	ground_timer = 0.2 * room_speed;


if !place_meeting(x, y, O_Grass) and ground_timer > 0
	ground_timer -= 1

	

// JUMP TIMER ____________________________________

	
if keyboard_check_pressed(vk_space) and jump_timer = 0
	jump_timer = 0.2 * room_speed;

if jump_timer > 0
	jump_timer -= 1

 
// cancel out __________________________
if jump_timer > 0 and ground_timer > 0 {
	jump_timer = 0
	ground_timer = 0
	Yspeed = -jmpforce;
}

if keyboard_check_released(vk_space) and Yspeed < 0 {
	Yspeed *= .6
}
#endregion

#region jason collisions (make ur own soon or else
// JASON HORISONTAL COLISIONS!!!!!!!! NOT MINE!!!!!!!!!!!!jkason scream demon grupon_________

if !place_meeting(x + Xspeed, y, O_Grass) 
	x += Xspeed;
else {
	x = round(x)
	while !place_meeting(x + sign(Xspeed), y, O_Grass) 
	x += sign(Xspeed);
	Xspeed = 0;
}


// JASON VERTICAL COLISON NOT MINE __________________________________________

if !place_meeting(x, y + Yspeed, O_Grass) 
	y += Yspeed;
else {
	y = round(y);
	while !place_meeting(x , y + sign(Yspeed), O_Grass) 
	y += sign(Yspeed);
	Yspeed = 0;
}
if !place_meeting(x, y + 1, O_Grass)
	Yspeed += grav;
#endregion

#region//________________________ ANIMATIONS______________________
if Yspeed = 0
	if keyboard_check(ord("A")) or keyboard_check(ord("D")) 
		sprite_index = S_Walk
	else
		sprite_index = S_Idle;
//RSDAJKDSAUIDHASUIHDIUASHUIDHSAUIHDIUSAHUDIHASUID
if Yspeed > 0 and sprite_index != S_FallEnd
	sprite_index = S_Fall 

if Yspeed < 0 and sprite_index != S_JumpEnd
	sprite_index = S_Jump
#endregion

