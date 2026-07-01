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
}

function postUpdate() {
	missesTxt.text = "Misses: " + misses;
}

function onNoteHit(e) {
	e.showSplash = false;
}