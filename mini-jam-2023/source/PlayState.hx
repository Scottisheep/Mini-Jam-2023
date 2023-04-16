package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxCollision;
import objects.ScreenSizeObject;
import objects.Timer;
import player.Player;

class PlayState extends FlxState
{
	private var playerChar:Player;
	private var background:ScreenSizeObject;
	private var walls:ScreenSizeObject;
	private var timer1:Timer;
	private var timer2:Timer;
	private var timer3:Timer;
	private var timer4:Timer;
	private var timerList:FlxTypedGroup<Timer>;

	override public function create()
	{
		super.create();
		initScreenSizeObjects();
		initTimers();
		initPlayer();
	}

	override public function update(elapsed:Float)
	{
		if (FlxCollision.pixelPerfectCheck(playerChar, walls))
		{
			playerChar.hitWall();
		}

		if (FlxG.keys.justPressed.C)
		{
			timer1.startCountdown();
		}

		for (t in timerList)
		{
			if (FlxG.overlap(t, playerChar) && FlxG.keys.pressed.SPACE)
			{
				t.avertDisaster();
			}
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

	private function initTimers()
	{
		timerList = new FlxTypedGroup<Timer>(4);
		timer1 = new Timer(FlxG.width * (6 / 7) - (Timer.TIMER_SIZE / 2), (FlxG.height / 2) - (Timer.TIMER_SIZE / 2));
		timer2 = new Timer((FlxG.width * (2 / 5)) - (Timer.TIMER_SIZE / 2), ((FlxG.height * (5 / 6)) - (Timer.TIMER_SIZE / 2)));
		timer3 = new Timer((FlxG.width * (2 / 5)) - (Timer.TIMER_SIZE / 2), (FlxG.height / 6) - (Timer.TIMER_SIZE / 2));
		timer4 = new Timer((FlxG.width * (2 / 9)) - (Timer.TIMER_SIZE / 2), (FlxG.height / 2) - (Timer.TIMER_SIZE / 2));

		timerList.add(timer1);
		timerList.add(timer2);
		timerList.add(timer3);
		timerList.add(timer4);

		add(timerList);
	}
}
