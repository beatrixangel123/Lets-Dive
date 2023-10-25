#region

if (hascontrol)
{
	
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_jump = keyboard_check_pressed(vk_space) || keyboard_check(ord("W"));
	key_pickup = keyboard_check_pressed(vk_alt);

}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
#endregion


var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv; 

if (place_meeting(x,y+1,obj_wall)) && (key_jump)
{
	vsp = -7;
}


//horizontal collision
if (place_meeting(x+hsp,y,obj_wall))
{
	while (!place_meeting(x+sign(hsp),y,obj_wall))
	{
		x += sign (hsp);
	}
hsp = 0;
}
x += hsp;

//vertical collision 
if (place_meeting(x,y+vsp,obj_wall))
{
	while (!place_meeting(x,y+sign(vsp),obj_wall))
	{
		y += sign (vsp);
	}
vsp = 0;
}
y += vsp;


//animation
if (hsp != 0) image_xscale = sign(hsp);  
		
	
//pickup weapon
if (keyboard_check_pressed(key_pickup))
{
	var pickupList = ds_list_create()
	var pickupCount = collision_circle_list(x, y, pickup_radius, obj_weapon, false, true, pickupList,true);
	
	if (pickupCount > 0) 
	{
		if (weapon == noone)
		{
			weapon = pickupList[| 0];
			
			weapon.target = id;
			weapon.is_being_carried = true;
		}
		else
		{
			//holding weapon
			for(var index = 0; index < pickupCount; index ++)
			{
				if (pickupList[| index] != weapon) 
				{
					//drop weapon
					weapon.target = noone;
					weapon.is_being_carried = false;
					
					//pickup
					weapon = pickupList [| index];
					weapon.target = id;
					weapon.is_being_carried = true;
					
					break; 
				}
			}
		}
	}
	ds_list_destroy(pickupList);
}