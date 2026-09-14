var hb;

function postCreate() {
	for (i in [accuracyTxt, scoreTxt, healthBar, healthBarBG])
		i.visible = false;

	missesTxt.y -= 110;
	missesTxt.size = 32;
	missesTxt.color = FlxColor.BLACK;

	hb = new FlxSprite(410,600).loadGraphic(Paths.image("game/bar"));
	hb.camera = camHUD;
	insert(0, hb);
	hb.scale.set(1.5,1.5);
	hb.antialiasing = false;
	camHUD.alpha = 0;
	doIconBop = false;
}

function onSongStart() {
	FlxTween.tween(camHUD, {alpha: 1}, 2, {ease:FlxEase.quartInOut});
}

var smoothHealth = 1;

function postUpdate() {
	missesTxt.text = "Misses: " + misses;
	smoothHealth = CoolUtil.fpsLerp(smoothHealth, health * 50, 0.19);
	healthBar.percent = smoothHealth;
	for (icon in iconArray) icon.scale.set(CoolUtil.fpsLerp(icon.scale.x, 1, 0.11), CoolUtil.fpsLerp(icon.scale.y, 1, 0.11));
}
function beatHit(b) for (icon in iconArray) if (b % 2 == 0) icon.scale.set(1.2, 1.2);

function onNoteHit(e) {
	e.showSplash = false;
}