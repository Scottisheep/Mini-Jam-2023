package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxCollision;
import objects.Background;
import objects.ScreenSizeObject;
import objects.StatusBar;
import objects.Timer;
import player.Player;

class PlayState extends FlxState
{
	private var playerChar:Player;
	private var background:Background;
	private var walls:ScreenSizeObject;
	private var timer1:Timer;
	private var timer2:Timer;
	private var timer3:Timer;
	private var timer4:Timer;
	private var timerList:FlxTypedGroup<Timer>;
	private var statBar:StatusBar;

	override public function create()
	{
		super.create();
		initScreenSizeObjects();
		initTimers();
		initPlayer();
		initStatusBar();
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

		statBar.checkAlertLevel(Timer.FAILS);
		background.checkFails(Timer.FAILS);

		if (Timer.FAILS >= 3)
		{
			gameOver();
		}

		super.update(elapsed);
	}

	private function initPlayer()
	{
		playerChar = new Player(FlxG.width / 2, FlxG.height / 2);
		add(playerChar);
		FlxG.watch.add(playerChar, "drag");
	}

	private function initScreenSizeObjects()
	{
		walls = new ScreenSizeObject(AssetPaths.rocketCollision__png);
		background = new Background(AssetPaths.background1__png);

		add(walls);
		add(background);
	}

	private function initTimers()
	{
		timerList = new FlxTypedGroup<Timer>(4);
		timer1 = new Timer(FlxG.width * (6 / 7) - (Timer.TIMER_SIZE / 2), (FlxG.height / 2) - (Timer.TIMER_SIZE / 2), -15);
		timer2 = new Timer((FlxG.width * (2 / 5)) - (Timer.TIMER_SIZE / 2), ((FlxG.height * (5 / 6)) - (Timer.TIMER_SIZE / 2)), -5);
		timer3 = new Timer((FlxG.width * (2 / 5)) - (Timer.TIMER_SIZE / 2), (FlxG.height / 6) - (Timer.TIMER_SIZE / 2), 5);
		timer4 = new Timer((FlxG.width * (2 / 9)) - (Timer.TIMER_SIZE / 2), (FlxG.height / 2) - (Timer.TIMER_SIZE / 2), 15);

		timerList.add(timer1);
		timerList.add(timer2);
		timerList.add(timer3);
		timerList.add(timer4);

		FlxG.watch.add(timer1, "breaking");
		FlxG.watch.add(timer1, "counting");
		FlxG.watch.add(timer1, "breakTimeMin");
		FlxG.watch.add(timer1, "breakTimeMax");
		FlxG.watch.add(timer1, "timeToBreak");
		FlxG.watch.add(timer1.breakingTimer, "timeLeft");

		add(timerList);
	}

	private function initStatusBar()
	{
		statBar = new StatusBar();
		add(statBar);
	}

	private function gameOver()
	{
		playerChar.kill();

		for (t in timerList)
		{
			t.kill();
		}
	}
}
