package
{
	import flash.display.Sprite;
	import flash.events.Event;

	public class SimpleCellGrid extends AbstractGrid
	{
		
		
		public function SimpleCellGrid(rows:uint = 10, cols:uint = 10, width:uint = 500, height:uint = 500)
		{
			super(rows, cols, width, height);
		}
		
		
		override protected function initGrid(width:int, height:int) : void 
		{
			
			var size:int = width / this.rows;
			for (var i:int = 0; i < rows; i++)
			{
				for (var j:int = 0; j < cols; j++)
				{
					var cell:AbstractCell = new SimpleCell(i, j, size);
					cell.x = j * size;
					cell.y = i * size;
					addChild(cell);
					if (Math.random() < 0.15)
					{
						cell.setColor(0x000000);
					}
				}
			}
			
			for (var index:int = 0; index < this.numChildren; index++)
			{
				var c:SimpleCell = this.getChildAt(index) as SimpleCell;
				for (var rIndex:int = - 1; rIndex < 2; rIndex++)
				{
					for (var cIndex:int = -1; cIndex < 2; cIndex++)
					{
						if ((rIndex != 0) || (cIndex != 0)) 
						{
							var currentCell:ICell = getCellByPosition(c.getRowIndex() + rIndex, c.getColIndex() + cIndex);
							if (currentCell != null)
							{
								c.addNeighbour(currentCell);
							}
						}
					}
				}		
			}
			

			
			this.graphics.lineStyle(2, 0xcccccc);
			this.graphics.beginFill(0xcccccc);
			this.graphics.drawRect(0, 0, width, height);
			this.graphics.endFill();
		}
	}
}