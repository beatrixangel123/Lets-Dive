#region
if (is_being_carried)
{
	image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay = firingdelay - 1;
recoil = max(0,recoil - 1);
if  (mouse_check_button(mb_left)) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay = 5;
	audio_sound_pitch(sn_shoot,choose(0.8,1.0,1.2));
	audio_play_sound(sn_shoot,5,false);
	
	with (instance_create_layer(x,y,"bullet", obj_bullet)) 
	{
		speed = 25;
		direction = other.image_angle + random_range (-3,3);
		image_angle = direction;
	}
}
}
x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_x(recoil,image_angle)


#endregion


