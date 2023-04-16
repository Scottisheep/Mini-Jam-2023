package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class ScreenSizeObject extends FlxSprite
{
	override public function new(graphic:FlxGraphicAsset)
	{
		super(0, 0);
		immovable = true;
		loadGraphic(graphic);
		setGraphicSize(FlxG.width, FlxG.height);
		updateHitbox();
	}
}
