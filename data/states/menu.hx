import funkin.menus.ModSwitchMenu;
var camMenu:FlxSprite;
var play; var opt; var cred; var stuff;
var curSelected = 0;

function postCreate() {
	CoolUtil.playMenuSong();

	camMenu = new FlxCamera();
	FlxG.cameras.add(camMenu,false);
	var bg = new FlxSprite().loadGraphic(Paths.image("menu/sand"));
	bg.camera = camMenu;
	add(bg);
	bg.scale.set(1280/bg.width, 720/bg.height);
	bg.updateHitbox();
	bg.screenCenter();
	var cock = new FlxSprite().loadGraphic(Paths.image("menu/fred"));
	cock.camera = camMenu;
	add(cock);
	cock.scale.set(1280/cock.width, 720/cock.height);
	cock.updateHitbox();
	cock.screenCenter();

	var title = new FlxText(0,0,800,"junkyard funkin");
	title.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
	title.color = FlxColor.BLACK;
	title.camera = camMenu;
	add(title);
	title.alignment = "center";
	title.screenCenter();
	title.y -= 250;

	play = new FlxText(128,224,800,"play the song");
	play.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
	play.color = FlxColor.BLACK;
	play.camera = camMenu;
	add(play);
	opt = new FlxText(128,288,800,"options");
	opt.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
	opt.color = FlxColor.BLACK;
	opt.camera = camMenu;
	add(opt);
	cred = new FlxText(128,352,800,"credits");
	cred.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
	cred.color = FlxColor.BLACK;
	cred.camera = camMenu;
	add(cred);
	stuff = new FlxText(128,416,800,"bonus content");
	stuff.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
	stuff.color = FlxColor.BLACK;
	stuff.camera = camMenu;
	add(stuff);

	trace(curSelected);
}

function update(e) {
	var upP = controls.UP_P;
	var downP = controls.DOWN_P;
	var scroll = FlxG.mouse.wheel;
	if (upP) { curSelected--; FlxG.sound.play(Paths.sound("scroll"));}
	if (downP) { curSelected++; FlxG.sound.play(Paths.sound("scroll"));}
	curSelected -= scroll;
	if (scroll != 0) FlxG.sound.play(Paths.sound("scroll"));
	if (curSelected >= 4) curSelected = 0;
	if (curSelected <= -1) curSelected = 3;
	switch(curSelected) {
		case 0:
			play.color = FlxColor.RED;
			opt.color = FlxColor.BLACK;
			cred.color = FlxColor.BLACK;
			stuff.color = FlxColor.BLACK;
		case 1:
			play.color = FlxColor.BLACK;
			opt.color = FlxColor.RED;
			cred.color = FlxColor.BLACK;
			stuff.color = FlxColor.BLACK;
		case 2:
			play.color = FlxColor.BLACK;
			opt.color = FlxColor.BLACK;
			cred.color = FlxColor.RED;
			stuff.color = FlxColor.BLACK;
		case 3:
			play.color = FlxColor.BLACK;
			opt.color = FlxColor.BLACK;
			cred.color = FlxColor.BLACK;
			stuff.color = FlxColor.RED;
		
	}

	if (controls.SWITCHMOD) {
		openSubState(new ModSwitchMenu());
		persistentUpdate = false;
		persistentDraw = true;
	}

	if (controls.ACCEPT) {
		switch(curSelected) {
			case 0:
				PlayState.loadSong("apeshit", "HARD", false, false);
				FlxG.switchState(new PlayState());
			case 1:
			case 2:
			case 3:
		}
	}
}