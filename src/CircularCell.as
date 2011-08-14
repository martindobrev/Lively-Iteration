package
{
	public class CircularCell extends AbstractCell
	{
		public function CircularCell(rowIndex:int, colIndex:int, size:uint, color:uint=0xffffff)
		{
			super(rowIndex, colIndex, size, color);
		}
		
		/**
		 * Overriding this method creates a new
		 * way of displaying the object
		 * 
		 * IN THIS CASE THIS IS A SIMPLE CIRCLE
		 */
		override public function draw() : void
		{
			
			this.graphics.clear();
			this.graphics.beginFill(this.color);
			this.graphics.drawCircle(size / 2, size / 2, size / 2 - 1);
			//this.graphics.drawRect(0, 0, size, size);
			this.graphics.endFill();
		}
	}
}