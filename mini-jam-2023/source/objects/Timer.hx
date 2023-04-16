package objects;

import flixel.FlxSprite;
import flixel.util.FlxTimer;

class Timer extends FlxSprite
{
	public static var TIMER_SIZE:Int = 64;
	public static var FAILS:Int = 0;

	public var counting:Bool = false;

	private var timerJustFinished:Bool = false;

	private var countdownTimer:FlxTimer = new FlxTimer();

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
		loadGraphic(AssetPaths.timer__png, true);
		setGraphicSize(TIMER_SIZE, TIMER_SIZE);
		updateHitbox();

		this.animation.add("countdown", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 1);
		this.animation.add("idle", [0], 0);
	}

	public function startCountdown()
	{
		timerJustFinished = true;
		counting = true;
		countdownTimer.start(10);
		this.animation.play("countdown");
	}

	override public function update(elapsed:Float)
	{
		if (countdownTimer.finished && timerJustFinished)
		{
			this.animation.play("idle");
			timerJustFinished = false;
			FAILS++;
		}
		super.update(elapsed);
	}

	public function avertDisaster()
	{
		countdownTimer.cancel();
		this.animation.play("idle");
	}
}
