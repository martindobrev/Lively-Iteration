package
{
	import flash.display.Sprite;
	
	/**
	 * Class Cell represents a basic drawable element in the Grid
	 * 
	 */ 
	public class SimpleCell extends AbstractCell
	{
		
		public function SimpleCell(rowIndex:int, colIndex:int, size:uint, color:uint = 0xffffff)
		{
			super(rowIndex, colIndex, size, color);
		}
		
		/**
		 * Overriding this method creates a new
		 * way of displaying the object
		 * 
		 * IN THIS CASE THIS IS A SIMPLE SQUARE
		 */
		override public function draw() : void
		{
			
			this.graphics.clear();
			this.graphics.beginFill(this.color);
			this.graphics.drawRect(1, 1, size - 1, size - 1);
			this.graphics.endFill();
		}
	}
}