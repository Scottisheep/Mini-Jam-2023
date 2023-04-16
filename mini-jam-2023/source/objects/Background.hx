package objects;

import flixel.FlxG;
import flixel.FlxSprite;

class Background extends FlxSprite
{
	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
		immovable = true;
		loadGraphic(AssetPaths.background__png);
		setGraphicSize(FlxG.width, FlxG.height);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
