import sys.FileSystem;
import funkin.ui.FunkinText;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import funkin.backend.system.framerate.Framerate;
import flixel.addons.effects.FlxTrail;

var pauseCam = new FlxCamera();

function create(event) {
	// cancel default pause menu!!
	event.cancel();

	cameras = [];
	cameras = [pauseCam];
	FlxG.switchState(new MainMenuState());
}