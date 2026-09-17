import flixel.text.FlxText.FlxTextAlign;

var tarPitch;
var isOver = false;
var canRestart = false;
var dieSfx:FlxSound; var gm:FlxSound; var accept:FlxSound;
var dead;
var retryTxt;

public var doGameOver = true;

function postCreate() {
	dieSfx = FlxG.sound.load(Paths.sound("death"));
	gm = FlxG.sound.load(Paths.music("junkyardGO"), 1.0, true);
	accept = FlxG.sound.load(Paths.sound("gameoverConfirm"));
	dead = new FlxSprite(0,0);
	dead.frames = Paths.getSparrowAtlas("characters/boyDeath");
	dead.updateHitbox(); dead.screenCenter();
	dead.x += 243; dead.y += 347;
	dead.animation.addByPrefix("idle", "idle", 12, false);
	dead.scale.set(boyfriend.scale.x, boyfriend.scale.y);
	insert(members.indexOf(boyfriend), dead);
	dead.visible = false;

	retryTxt = new FlxText(900, 900);
	retryTxt.setFormat(Paths.font("vcr.ttf"), 140, FlxColor.BLACK, FlxTextAlign.CENTER);
	retryTxt.text = "Retry?";
	insert(members.indexOf(dead), retryTxt);
	retryTxt.alpha = 0;

	for (i in strumLines) {
		trace(i.vocals); 
		vocals.stop();
	}
}
function onGameOver(e) {
	muteVocalsOnMiss = false;
	canPause = false;
	trace("uh oh! you died!!");
	e.cancel();
	camGame.followLerp = 0;
	if (!isOver && doGameOver) {
	FlxTween.cancelTweensOf(camGame.scroll);
	FlxTween.cancelTweensOf(camGame);
	FlxTween.cancelTweensOf(camHUD);
	inst.fadeOut(0.5);
	vocals.fadeOut(0.5);
	for (i in strumLines) {
		trace(i.vocals); 
		vocals.pitch = 0.01;
	}
	dad.animation.play("idle", true);
	isOver = true;
	FlxTween.tween(camHUD, {alpha:0, zoom:2}, 0.3);
	dieSfx.play();
	boyfriend.visible = false;
	dead.visible = true;
	dead.animation.play("idle", true);
	FlxTween.tween(camGame.scroll, {x: boyfriend.x - 300, y: boyfriend.y - 0}, 2, {ease:FlxEase.quartInOut});
	FlxTween.tween(camGame, {zoom: 0.5}, 1, {ease:FlxEase.elasticOut});
	
	new FlxTimer().start(1.1, function(t) {
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();
		FlxTween.tween(camGame, {zoom: 0.7}, 1, {ease:FlxEase.elasticOut});
		defaultCamZoom = 0.7;
		
		new FlxTimer().start(2, function(t) {
			canRestart = true;
			gm.play();
			FlxTween.tween(retryTxt, {y: 600, alpha: 1}, 2, {ease:FlxEase.quartOut});
		});
	});
	}
}

function postUpdate(e) {
	if (isOver) {
		health = 0.05;
		if (!canRestart) inst.pitch = vocals.pitch = FlxMath.lerp(inst.pitch, 0, e*5);
		if (canRestart) {
			if (FlxG.keys.justPressed.ENTER) {
				gm.stop();
				accept.play();
				FlxTween.cancelTweensOf(retryTxt);
				retryTxt.alpha = 1;
				retryTxt.y = 600;
				retryTxt.angle = 20;
				FlxTween.tween(retryTxt, {angle: 0}, 1, {ease:FlxEase.elasticOut});
				FlxTween.tween(camGame.scroll, {y: camGame.scroll.y - 2400}, 2, {ease:FlxEase.quartIn});
				FlxTween.tween(camGame, {zoom: defaultCamZoom * 1.2}, 0.95, {ease:FlxEase.elasticOut});
				new FlxTimer().start(1, function(t) {
					FlxTween.tween(camGame, {zoom: 0.4}, 1, {ease:FlxEase.quadIn});
					new FlxTimer().start(1, function(t) {
						camGame.visible = false;
						new FlxTimer().start(2, function(t) {
							PlayState.loadSong(PlayState.SONG.meta.name, PlayState.difficulty);
							FlxG.switchState(new PlayState());
						});
					});
				});
			}
		}
	}
}