package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	static var SPEED:Float = 150;
	static var DEACCEL:Float = -25;

	public var doDrag:Bool;
	public var touchingWall:Bool = true;

	private var travelDirection:Float;

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
		if (doDrag)
		{
			drag = FlxPoint.get(SPEED, SPEED).rotateByDegrees(travelDirection);
			if (drag.x < 0)
			{
				drag.x *= -1;
			}
			if (drag.y < 0)
			{
				drag.y *= -1;
			}
		}
		else
		{
			drag = FlxPoint.weak(0, 0);
		}
	}

	public function hitWall()
	{
		touchingWall = true;
		doDrag = true;
		velocity = FlxPoint.get(1, 1).rotateByDegrees(travelDirection).scale(DEACCEL);
	}

	public function takeoff()
	{
		if (touchingWall)
		{
			doDrag = false;
			travelDirection = this.getMidpoint().degreesTo(FlxG.mouse.getPosition());

			velocity = FlxPoint.weak(1, 0).rotateByDegrees(travelDirection).scale(SPEED);
			touchingWall = false;
		}
	}
}
