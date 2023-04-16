package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	static var SPEED:Float = 150;
	static var DEACCEL:Float = 10;

	public var doCollision:Bool;
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
		touchingWall = true;
		drag = FlxPoint.weak(SPEED, SPEED).rotateByDegrees(angle);
		velocity = FlxPoint.weak(1, 1).rotateByDegrees(angle).scale(DEACCEL);
	}

	public function takeoff()
	{
		if (touchingWall)
		{
			drag = FlxPoint.get(0, 0);
			doCollision = false;
			var dummyVel = FlxPoint.weak(1, 0);

			velocity = dummyVel.rotateByDegrees(this.getMidpoint().degreesTo(FlxG.mouse.getPosition())).scale(SPEED);
			touchingWall = false;
			drag.put();
		}
	}
}
