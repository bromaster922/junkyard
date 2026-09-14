function postCreate() {
	camHUD.zoom = 2.1;
}

function beatHit(b) {
	switch(b) {
		case 8: FlxTween.tween(camHUD, {zoom:1}, 60/Conductor.bpm*2, {ease:FlxEase.quartOut});
	}
}