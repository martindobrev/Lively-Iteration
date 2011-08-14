package
{
	public class CircularCellGrid extends AbstractGrid
	{
		public function CircularCellGrid(rows:uint = 10, cols:uint = 10, width:uint = 500, height:uint = 500)
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
					var cell:CircularCell = new CircularCell(i, j, size);
					cell.x = j * size;
					cell.y = i * size;
					addChild(cell);
					if (Math.random() < 0.15)
					{
						cell.setColor(0x000000);
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



