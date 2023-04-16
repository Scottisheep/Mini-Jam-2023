package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import haxe.macro.Format;

class Player extends FlxSprite
{
	static var SPEED:Float = 150;

	public var touchingWall:Bool = true;

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.mouse.justPressed)
		{
			takeoff();
		}
	}

	public function hitWall()
	{
		velocity = FlxPoint.get(0, 0);
		touchingWall = true;
	}

	public function takeoff()
	{
		if (touchingWall)
		{
			var dummyVel = FlxPoint.weak(1, 0);
			touchingWall = false;

			velocity = dummyVel.rotateByDegrees(this.getMidpoint().degreesTo(FlxG.mouse.getPosition())).scale(SPEED);
		}
	}
}
