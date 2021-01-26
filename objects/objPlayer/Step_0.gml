var spd = 5;
var spd = keyboard_check(vk_shift) ? spd/2 : spd;
var hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
var vInput = keyboard_check(vk_down) - keyboard_check(vk_up);
if mode == 0{
	image_blend = make_color_rgb(238, 28, 36);
	hspeed = 0;
	vspeed = 0;
	if hInput != 0 || vInput != 0{
		var dir = point_direction(0, 0, hInput, vInput);
		var moveX = lengthdir_x(spd, dir);
		var moveY = lengthdir_y(spd, dir);
		x += moveX;
		y += moveY;
	}
}
if mode == 1{
	image_blend = make_color_rgb(0, 60, 255);
	var left = keyboard_check(vk_left);
	var up = keyboard_check(vk_up);
	var right = keyboard_check(vk_right);
	var down = keyboard_check(vk_down);
	if jumpstage == 3{
		jumpstage = 1;
	}
	if x + hspeed < 5 + 8{
		x = 5 + 8;
		if hspeed < 0{
			hspeed = 0;
		}
		if movement == 2{
			jumpstage = 3;
		}
	}
	if x + hspeed > room_width - 5 - 8{
		x = room_width - 5 - 8;
		if hspeed > 0{
			hspeed = 0;
		}
		if movement == 4{
			jumpstage = 3;
		}
	}
	if y + vspeed > room_height - 5 - 8{
		y = room_height - 5 - 8;
		if vspeed > 0{
			vspeed = 0;
		}
		if movement == 1{
			jumpstage = 3;
		}
	}
	if y + vspeed < 5 + 8{
		y = 5 + 8;
		if vspeed < 0{
			vspeed = 0;
		}
		if movement == 3{
			jumpstage = 3;
		}
	}
	if moveable == 1{
		// 红心式移动
		if movement == 0{
			repeat(spd*10){
				if left{
					if(!position_meeting(x - sprite_width/2, y, objBlock)){
						x-=0.1;
					}
				}
				if up{
					if(!position_meeting(x, y - sprite_height/2, objBlock)){
						y-=0.1;
					}
				}
				if right{
					if(!position_meeting(x + sprite_width/2, y, objBlock)){
						x+=0.1;
					}
				}
				if down{
					if(!position_meeting(x, y + sprite_height/2, objBlock)){
						y+=0.1;
					}
				}
			}
		}

		// 重力向下
		if movement == 1{
			image_angle = 0;
			hspeed = 0;
			repeat(spd*10){
				if left{
					if(!position_meeting(x - sprite_width/2, y, objBlock)){
						x-=0.1;
					}
				}
				if right{
					if(!position_meeting(x + sprite_width/2, y, objBlock)){
						x+=0.1;
					}
				}
			}
			if up{
				if(jumpstage == 1 && vspeed == 0){
					jumpstage = 2;
					vspeed = -6;
				}
			}
		}
		if(jumpstage == 2 && movement == 1){
			if(up == 0 && vspeed <= -1){
				vspeed = -1;
			}
			if(vspeed > 0.5 && vspeed < 8){
				vspeed += 0.6;
			}
			if(vspeed > -1 && vspeed <= 0.5){
				vspeed += 0.2;
			}
			if(vspeed > -4 && vspeed <= -1){
				vspeed += 0.5;
			}
			if(vspeed <= -4){
				vspeed += 0.2;
			}
		}

		// 重力向左
		if movement == 2{
			image_angle = 270;
			vspeed = 0;
			repeat(spd*10){
				if up{
					if(!position_meeting(x, y - sprite_height/2, objBlock)){
						y-=0.1;
					}
				}
				if down{
					if(!position_meeting(x, y + sprite_height/2, objBlock)){
						y+=0.1;
					}
				}
			}
			if right{
				if(jumpstage == 1 && hspeed == 0){
					jumpstage = 2;
					hspeed = 6;
				}
			}
		}
		if(jumpstage == 2 && movement == 2){
			if(right == 0 && hspeed >= 1){
				hspeed = 1;
			}
			if(hspeed < -0.5 && hspeed > -8){
				hspeed -= 0.6;
			}
			if(hspeed < 1 && hspeed >= -0.5){
				hspeed -= 0.2;
			}
			if(hspeed < 4 && hspeed >= 1){
				hspeed -= 0.5;
			}
			if(hspeed >= 4){
				hspeed -= 0.2;
			}
		}

		// 重力向上
		if movement == 3{
			image_angle = 180;
			hspeed = 0;
			repeat(spd*10){
				if left{
					if(!position_meeting(x - sprite_width/2, y, objBlock)){
						x-=0.1;
					}
				}
				if right{
					if(!position_meeting(x + sprite_width/2, y, objBlock)){
						x+=0.1;
					}
				}
			}
			if down{
				if(jumpstage == 1 && vspeed == 0){
					jumpstage = 2;
					vspeed = 6;
				}
			}
		}
		if(jumpstage == 2 && movement == 3){
			if(down == 0 && vspeed >= 1){
				vspeed = 1;
			}
			if(vspeed < -0.5 && vspeed > -8){
				vspeed -= 0.6;
			}
			if(vspeed < 1 && vspeed >= -0.5){
				vspeed -= 0.2;
			}
			if(vspeed < 4 && vspeed >= 1){
				vspeed -= 0.5;
			}
			if(vspeed >= 4){
				vspeed -= 0.2;
			}
		}

		// 重力向右
		if movement == 4{
			image_angle = 90;
			vspeed = 0;
			repeat(spd*10){
				if up{
					if(!position_meeting(x, y - sprite_height/2, objBlock)){
						y-=0.1;
					}
				}
				if down{
					if(!position_meeting(x, y + sprite_height/2, objBlock)){
						y+=0.1;
					}
				}
			}
			if left{
				if(jumpstage == 1 && hspeed == 0){
					jumpstage = 2;
					hspeed = -6;
				}
			}
		}
		if(jumpstage == 2 && movement == 4){
			if(left == 0 && hspeed <= -1){
				hspeed = -1;
			}
			if(hspeed > 0.5 && hspeed < 8){
				hspeed += 0.6;
			}
			if(hspeed > -1 && hspeed <= 0.5){
				hspeed += 0.2;
			}
			if(hspeed > -4 && hspeed <= -1){
				hspeed += 0.5;
			}
			if(hspeed <= -4){
				hspeed += 0.2;
			}
		}
	}
}

x = median(sprite_width/2, x, room_width - sprite_width/2);
y = median(sprite_height/2, y, room_height - sprite_height/2);
