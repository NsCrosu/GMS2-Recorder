instance_destroy(objRecorder);
var ghostFileName = "recording.json";

if file_exists(ghostFileName){
	var ghostFile = file_text_open_read(ghostFileName);
	ghostDataRoot = json_decode(file_text_read_string(ghostFile));
	ghostData = ghostDataRoot[? "root"];
	ghostFrames = ds_list_size(ghostData);
	frame = ghostFrames - 1/* 0 */;
	ghostFile = file_text_close(ghostFile);
}else{
	instance_destroy();
	show_debug_message("\n### Ghost Destroyed ###\n");
}
