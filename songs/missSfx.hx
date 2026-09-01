var missSfx = "miss";
var missVol = 0.7;
function onPlayerMiss(event) {
	if (!event.note.isSustainNote) FlxG.sound.play(Paths.sound(missSfx + Std.string(FlxG.random.int(1,3))), missVol);
	event.playMissSound = false;
}