import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextFormat;
import flixel.text.FlxText.FlxTextAlign;

var txt1; var txt2;
var switchSfx;

var screenD; var boyD;
var black;

function create() {
	dad.visible = false;
	camHUD.visible = false;

	var sky = new FlxSprite().loadGraphic(Paths.image("menus/credits/sky"));
	add(sky);
	var sun = new FlxSprite().loadGraphic(Paths.image("menus/credits/sun"));
	add(sun);
	var bg = new FlxSprite().loadGraphic(Paths.image("menus/credits/bg"));
	add(bg);
	var g = new FlxSprite().loadGraphic(Paths.image("menus/credits/ground"));
	add(g);
	var screen = new FlxSprite().loadGraphic(Paths.image("menus/credits/screen"));
	add(screen);
	var boy = new FlxSprite().loadGraphic(Paths.image("menus/credits/boy"));
	add(boy);
	screenD = new FlxSprite().loadGraphic(Paths.image("menus/credits/screenD"));
	add(screenD);
	boyD = new FlxSprite().loadGraphic(Paths.image("menus/credits/boyD"));
	add(boyD);
	sky.scale.set(1.5, 1.5);

	screenD.visible = boyD.visible = false;

	camGame.followLerp = 1;
	for (i in [sky, sun, bg, g, screen, boy, screenD, boyD]) {
		i.updateHitbox();
		i.screenCenter();
	}
	sky.scrollFactor.set(0.1, 0.1);
	sun.scrollFactor.set(0.3, 0.3);
	bg.scrollFactor.set(0.7, 0.7);
	sun.x -= 130;
	bg.x -= 390;
	for (i in [g, screen, boy, screenD, boyD]) i.x -= 515;
	for (i in [bg, g, screen, boy, screenD, boyD]) i.y += 100;

	txt1 = new FlxText(360, 260, 200);
	txt1.setFormat(Paths.font("vcr.ttf"), 40, FlxColor.BLACK, FlxTextAlign.CENTER);
	txt1.scale.set(2,2);
	txt1.text = "JUNKYARD";
	txt1.angle = 2;
	add(txt1);
	txt2 = new FlxText(360, 370, 200);
	txt2.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.BLACK, FlxTextAlign.CENTER);
	txt2.scale.set(2,2);
	txt2.text = "FUNKIN";
	txt2.angle = 3;
	add(txt2);

	switchSfx = FlxG.sound.play(Paths.sound("projectorClick"), 0.01);

	bl = new FlxSprite().makeGraphic(2000, 2000, FlxColor.BLACK);
	bl.scale.set(50, 50);
	bl.scrollFactor.set(0,0);
	add(bl);
	bl.alpha = 0;
}

function switchTxt(v1, v2) {
	screenD.visible = boyD.visible = true;
	txt1.visible = txt2.visible = false;
	var size = 40;
	if (v1 == "EMERALDISHERE" || v1 == "BROMASTER819") size = 27;
	txt1.setFormat(Paths.font("vcr.ttf"), size, FlxColor.BLACK, FlxTextAlign.CENTER);

	txt1.text = v1;
	txt2.text = v2;
	if (v1 != "off") {
	new FlxTimer().start(.25, function(t) {
		screenD.visible = boyD.visible = false;
		txt1.visible = txt2.visible = true;
	});
	} else {
		trace("turn that shit off!!!!");
	}
	switchSfx = FlxG.sound.play(Paths.sound("projectorClick"), 0.8);
}

function beatHit(b) {
	switch(b) {
		case 192: FlxTween.tween(bl, {alpha: 1}, 60/Conductor.bpm*8);
	}
}

function update(e) {
	if (FlxG.keys.justPressed.ENTER) FlxG.switchState(new MainMenuState());
}