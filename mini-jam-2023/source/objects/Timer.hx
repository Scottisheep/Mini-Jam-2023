package objects;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.util.FlxTimer;

class Timer extends FlxSprite
{
	public static var TIMER_SIZE:Int = 64;
	public static var FAILS:Int = 0;
	public static var SUCCESSES:Int = 0;

	private static var TIMER_MINIMUM:Int = 5;
	private static var TIMER_MAXIMUM:Int = 25;

	private var counting:Bool = false;
	private var timerJustFinished:Bool = false;
	private var breaking:Bool = false;

	private var countdownTimer:FlxTimer = new FlxTimer();

	public var breakingTimer:FlxTimer = new FlxTimer();

	private var randomizer:FlxRandom = new FlxRandom();

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
		loadGraphic(AssetPaths.timer__png, true);
		setGraphicSize(TIMER_SIZE, TIMER_SIZE);
		updateHitbox();

		this.animation.add("countdown", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 1);
		this.animation.add("idle", [0], 0);
	}

	override public function update(elapsed:Float)
	{
		if (countdownTimer.finished && timerJustFinished)
		{
			this.animation.play("idle");
			timerJustFinished = false;
			FAILS++;
			counting = false;
		}
		decideToBreak();
		super.update(elapsed);
	}

	public function avertDisaster()
	{
		countdownTimer.cancel();
		this.animation.play("idle");
		SUCCESSES++;
	}

	public function startCountdown()
	{
		timerJustFinished = true;
		counting = true;
		countdownTimer.start(10);
		this.animation.play("countdown");
	}

	public function decideToBreak()
	{
		if (breaking == false)
		{
			breakingTimer.start(randomizer.float(TIMER_MINIMUM, TIMER_MAXIMUM));

			breaking = true;
		}
		else if (breakingTimer.finished && counting == false && breaking == true)
		{
			startCountdown();
			breaking = false;
		}
	}
}
