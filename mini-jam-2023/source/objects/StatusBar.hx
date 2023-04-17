package objects;

import flixel.FlxSprite;

class StatusBar extends FlxSprite
{
	private static var STATUS_SIZE:Int = 128;

	override public function new()
	{
		super(15, 0);
		loadGraphic(AssetPaths.statusIndicator__png, true);

		animation.add("alert 0", [0]);
		animation.add("alert 1", [1]);
		animation.add("alert 2", [2]);
		animation.add("alert 3", [3]);

		setGraphicSize(STATUS_SIZE, STATUS_SIZE);
		updateHitbox();
	}

	public function checkAlertLevel(fails:Int)
	{
		if (fails == 0)
		{
			animation.play("alert 0");
		}
		else if (fails == 1)
		{
			animation.play("alert 1");
		}
		else if (fails == 2)
		{
			animation.play("alert 2");
		}
		else
		{
			animation.play("alert 3");
		}
	}
}
