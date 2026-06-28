var hb;

function postCreate() {
	for (i in [accuracyTxt, scoreTxt, healthBar, healthBarBG])
		i.visible = false;

	missesTxt.y -= 150;
	missesTxt.size = 48;
	missesTxt.color = FlxColor.BLACK;

	hb = new FlxSprite(410,600).loadGraphic(Paths.image("game/bar"));
	hb.camera = camHUD;
	insert(0, hb);
	hb.scale.set(1.5,1.5);
	hb.antialiasing = false;
}

function onNoteHit(e) {
	e.showSplash = false;
}