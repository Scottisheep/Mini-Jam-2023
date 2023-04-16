package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import objects.ScreenSizeObject;
import player.Player;

class PlayState extends FlxState
{
	private var playerChar:Player;
	private var background:ScreenSizeObject;
	private var walls:ScreenSizeObject;

	override public function create()
	{
		super.create();
		initScreenSizeObjects();
		initPlayer();
		FlxG.watch.add(playerChar, "touchingWall");
		FlxG.watch.add(playerChar, "drag");
		FlxG.watch.add(playerChar, "velocity");
		FlxG.watch.add(playerChar, "angle");
	}

	override public function update(elapsed:Float)
	{
		if (FlxCollision.pixelPerfectCheck(playerChar, walls))
		{
			playerChar.hitWall();
		}

		super.update(elapsed);
	}

	private function initPlayer()
	{
		playerChar = new Player(FlxG.width / 2, FlxG.height / 2);
		add(playerChar);
	}

	private function initScreenSizeObjects()
	{
		walls = new ScreenSizeObject(AssetPaths.rocketCollision__png);
		background = new ScreenSizeObject(AssetPaths.background__png);

		add(background);
		add(walls);
	}
}
