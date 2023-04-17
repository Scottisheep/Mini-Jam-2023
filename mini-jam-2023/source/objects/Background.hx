package objects;

class Background extends ScreenSizeObject
{
	public function checkFails(fails:Int)
	{
		if (fails == 0)
		{
			loadGraphic(AssetPaths.background1__png);
		}
		else if (fails == 1)
		{
			loadGraphic(AssetPaths.background2__png);
		}
		else if (fails == 2)
		{
			loadGraphic(AssetPaths.background3__png);
		}
		else
		{
			loadGraphic(AssetPaths.background4__png);
		}
	}
}
