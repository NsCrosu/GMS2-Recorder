if keyboard_check_pressed(vk_f2){
	ghostRecord = !ghostRecord;
	if !ghostRecord && ds_exists(ghostRecordList, ds_type_list){
		var _wrapper = ds_map_create();
		ds_map_add_list(_wrapper, "root", ghostRecordList);
		var _theLot = json_encode(_wrapper);
		if file_exists("recording.json"){file_delete("recording.json");}
		var _recordFile = file_text_open_write("recording.json");
		file_text_write_string(_recordFile, _theLot);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
	}
}
if keyboard_check_pressed(vk_f3){
	instance_create_depth(0, 0, 0, objGhost);
}

if ghostRecord && instance_exists(objPlayer){
	if !ds_exists(ghostRecordList, ds_type_list){
		ghostRecordFrames = 1;
		ghostRecordList = ds_list_create();
	}
	
	var _frameToRecord = ds_map_create();
	with(objPlayer){
		_frameToRecord[? "x"] = x;
		_frameToRecord[? "y"] = y;
		_frameToRecord[? "image_blend"] = image_blend;
	}
	
	ds_list_add(ghostRecordList, _frameToRecord);
	ds_list_mark_as_map(ghostRecordList, ds_list_size(ghostRecordList) - 1);
	ghostRecordFrames++;
}
