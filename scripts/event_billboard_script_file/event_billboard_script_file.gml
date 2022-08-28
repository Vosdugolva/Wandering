// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function billboard_post(_event, _data) {
    with (Event_billboard) {
        BB_Post(_event, _data);
        return true;
    }
    return false;
}

function billboard_read(_event) {
	var _posting = 0;
    with (Event_billboard) {
        _posting = BB_Read(_event);
        
    }
    return _posting;
}