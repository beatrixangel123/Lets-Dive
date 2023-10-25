#region Interaction
	popup_radius = 10
	interaction_object =  instance_create_layer(x, y - 26, layer, obj_interaction); 
	interaction_object.visible = false;
#endregion

target = noone;
is_being_carried = false;

firingdelay = 0; 
recoil = 0;



