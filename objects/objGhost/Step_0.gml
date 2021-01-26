if keyboard_check_pressed(vk_f3){
	instance_create_depth(0, 0, 0, objRecorder);
	instance_destroy();
	exit;
}
// 重播
/*
if frame < ghostFrames{
	if frame == 0{image_alpha = 1;}
	frameData = ghostData[| frame];
	x = frameData[? "x"];
	y = frameData[? "y"];
	image_blend = frameData[? "image_blend"];
	frame++;
}else{
	image_alpha = max(image_alpha - 0.0025, 0);
	if image_alpha == 0{frame = 0;}
}
*/

// 倒放
if frame > 0{
	if frame == ghostFrames - 1{image_alpha = 1;}
	frameData = ghostData[| frame];
	x = frameData[? "x"];
	y = frameData[? "y"];
	image_blend = frameData[? "image_blend"];
	frame--;
}else{
	image_alpha = max(image_alpha - 0.0025, 0);
	if image_alpha == 0{frame = ghostFrames - 1;}
}
