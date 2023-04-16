package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import objects.Background;
import objects.Wall;
import player.Player;

class PlayState extends FlxState
{
	private var playerChar:Player;
	private var wall:Wall;
	private var background:Background = new Background(0, 0);

	override public function create()
	{
		add(background);
		background.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		super.create();
		initPlayer();
		initWall();
		FlxG.watch.add(playerChar, "touchingWall");
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(playerChar, wall, function onOverlap(player, wall)
		{
			playerChar.hitWall();
		});

		super.update(elapsed);
	}

	private function initPlayer()
	{
		playerChar = new Player(FlxG.width / 2, FlxG.height / 2);
		add(playerChar);
	}

	private function initWall()
	{
		wall = new Wall(0, 0);
		add(wall);
	}
}
