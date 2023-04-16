package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;

class Player extends FlxSprite
{
	static var SPEED:Float = 150;
	static var DEACCEL:Float = 125;

	public var doDrag:Bool;
	public var touchingWall:Bool = true;

	private var travelDirection:Float;
	private var travelVelocity:FlxPoint;

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
			if (travelVelocity.x > 0)
			{
				drag.x = travelVelocity.x;
			}
			else
			{
				drag.x = travelVelocity.x * -1;
			}
			if (travelVelocity.y > 0)
			{
				drag.y = travelVelocity.y;
			}
			else
			{
				drag.y = travelVelocity.y * -1;
			}
			drag.scale(DEACCEL);
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
		velocity = velocity * -1;
	}

	public function takeoff()
	{
		if (touchingWall)
		{
			doDrag = false;
			travelDirection = this.getMidpoint().degreesTo(FlxG.mouse.getPosition());

			velocity = FlxPoint.weak(1, 0).rotateByDegrees(travelDirection).scale(SPEED);
			travelVelocity = velocity;
			touchingWall = false;
		}
	}
}
