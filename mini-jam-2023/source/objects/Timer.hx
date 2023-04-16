package objects;

import flixel.FlxSprite;

class Timer extends FlxSprite
{
	public static var TIMER_SIZE:Int = 64;

	public var counting:Bool = false;

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
		loadGraphic(AssetPaths.timer__png, true);
		setGraphicSize(TIMER_SIZE, TIMER_SIZE);
		updateHitbox();

		this.animation.add("countdown", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 1);
	}

	public function startCountdown()
	{
		counting = true;
		this.animation.play("countdown");
	}
}
