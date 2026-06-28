var nut1:FlxSprite; var nut2:FlxSprite; var nut3:FlxSprite;
var bg1; var bg2; var bg3;

var camNut;

function postCreate() {
	camNut = new FlxCamera();
	camNut.bgColor = FlxColor.TRANSPARENT;
	//FlxG.cameras.remove(camHUD, false);
	FlxG.cameras.add(camNut, false);
	//FlxG.cameras.add(camHUD, false);

	bg1 = new FlxSprite(0, 720).makeGraphic(427, 720, FlxColor.fromRGB(220,220,220,255));
	bg1.camera = camNut;
	add(bg1);
	bg2 = new FlxSprite(427, -720).makeGraphic(427, 720, FlxColor.WHITE);
	bg2.camera = camNut;
	add(bg2);
	bg3 = new FlxSprite(854, 720).makeGraphic(427, 720, FlxColor.fromRGB(220,220,220,255));
	bg3.camera = camNut;
	add(bg3);

	nut1 = new FlxSprite();
	nut1.frames = Paths.getSparrowAtlas("characters/conut_fedd");
	nut1.camera = camNut;
	nut1.scale.set(0.6, 0.6);
	nut1.screenCenter();
	nut1.x -= 427;
	nut1.y = 809;
	add(nut1);
	nut2 = new FlxSprite();
	nut2.frames = Paths.getSparrowAtlas("characters/conut_fedd");
	nut2.camera = camNut;
	nut2.scale.set(0.6, 0.6);
	nut2.screenCenter();
	nut2.y = -631;
	add(nut2);
	nut3 = new FlxSprite();
	nut3.frames = Paths.getSparrowAtlas("characters/conut_fedd");
	nut3.camera = camNut;
	nut3.scale.set(0.6, 0.6);
	nut3.screenCenter();
	nut3.x += 427;
	nut3.y = 809;
	add(nut3);
	
	for (i in [nut1, nut2, nut3]) {
		i.animation.addByPrefix("idle", "idle", 24, false);
		i.animation.addByPrefix("left", "left", 24, false);
		i.animation.addByPrefix("down", "down", 24, false);
		i.animation.addByPrefix("up", "up", 24, false);
		i.animation.addByPrefix("right", "right", 24, false);
		i.animation.play("idle");
	}
}

function beatHit(b) {
	switch(b) {
		case 212: 
			barIn(1);
			nut1.animation.play("left", true);
			FlxTween.tween(camNut, {zoom:1.05}, 0.5, {ease:FlxEase.quartOut});
		case 213: 
			barIn(2);
			nut1.animation.play("left", true);
			nut2.animation.play("up", true);
			FlxTween.tween(camNut, {zoom:1.1}, 0.5, {ease:FlxEase.quartOut});
		case 214: 
			barIn(3);
			nut1.animation.play("left", true);
			nut2.animation.play("up", true);
			nut3.animation.play("right", true);
			FlxTween.tween(camNut, {zoom:1.15}, 0.5, {ease:FlxEase.quartOut});
		case 215: 
			nut1.animation.play("left", true);
			nut2.animation.play("up", true);
			nut3.animation.play("right", true);
			FlxTween.tween(camNut, {zoom:1.2}, 0.5, {ease:FlxEase.quartOut});
		case 216: 
			nut1.animation.play("left", true);
			nut2.animation.play("up", true);
			nut3.animation.play("right", true);
			barOut(1);
			barOut(2);
			barOut(3);
	}
}

function barIn(num) {
	switch(num) { 
		case 1:
			FlxTween.tween(bg1, {y:0}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut1, {y:89}, 0.5, {ease:FlxEase.quartOut});
		case 2:
			FlxTween.tween(bg2, {y:0}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut2, {y:89}, 0.5, {ease:FlxEase.quartOut});
		case 3:
			FlxTween.tween(bg3, {y:0}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut3, {y:89}, 0.5, {ease:FlxEase.quartOut});
	}
}
function barOut(num) {
	switch(num) { 
		case 1:
			FlxTween.tween(bg1, {y:720}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut1, {y:809}, 0.5, {ease:FlxEase.quartOut});
		case 2:
			FlxTween.tween(bg2, {y:-720}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut2, {y:-631}, 0.5, {ease:FlxEase.quartOut});
		case 3:
			FlxTween.tween(bg3, {y:720}, 0.5, {ease:FlxEase.quartOut});
			FlxTween.tween(nut3, {y:809}, 0.5, {ease:FlxEase.quartOut});
	}
}