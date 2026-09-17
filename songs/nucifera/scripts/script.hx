var bl;
var blur = new CustomShader("blur");

function postCreate() {
	camHUD.zoom = 2.1;
	bl = new FlxSprite().makeGraphic(2000, 2000, FlxColor.BLACK);
	bl.scale.set(50, 50);
	bl.scrollFactor.set(0,0);
	add(bl);
	bl.alpha = 0;

	if (Options.gameplayShaders) camGame.addShader(blur);
	blur.blurSize = 1;
}

function beatHit(b) {
	switch(b) {
		case 8: FlxTween.tween(camHUD, {zoom:1}, 60/Conductor.bpm*2, {ease:FlxEase.quartOut});
		case 328: FlxTween.tween(camHUD, {x:300, y:720*1.5, zoom:0.6}, 60/Conductor.bpm*64, {ease:FlxEase.smoothStepInOut});
		case 360: FlxTween.tween(bl, {alpha: 1}, 60/Conductor.bpm*32);
	}
}

function postUpdate(e) {
	blur.blurSize = bl.alpha * 20; 
}