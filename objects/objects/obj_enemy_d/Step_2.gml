if alive=false
{
    image_alpha-=0.05;//change this to affect the fading speed
    if image_alpha<0 instance_destroy();
}