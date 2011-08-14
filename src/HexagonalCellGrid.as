package
{
	public class HexagonalCellGrid extends AbstractGrid
	{
		
		public static const SQRT_THREE_div_FOUR:Number  = 0.433012701892219;
		
		public function HexagonalCellGrid(rows:uint = 10, cols:uint = 10, size:int = 10)
		{
			super(rows, cols, size);
			
		}
		
		override protected function initGrid() : void 
		{
			var width:int = cols * size * 1.5 + 5;
			var height:int = rows * size * SQRT_THREE_div_FOUR + size / 2;
			
			for (var i:int = 0; i < rows; i++)
			{
				for (var j:int = 0; j < cols; j++)
				{
					var cell:AbstractCell = new HexagonalCell(i, j, size);
					if (0 == i % 2)
					{
						cell.x = j * size * 1.5;
					}
					else
					{
						cell.x = size / 2 * 1.5 + j * size * 1.5;	
					}
					cell.y = i * size  * SQRT_THREE_div_FOUR;
					addChild(cell);
					
					if (Math.random() < 0.35)
					{
						cell.setColor(0x000000);
					}
				}
			}
			
			for (var index:int = 0; index < this.numChildren; index++)
			{
				var c:HexagonalCell = this.getChildAt(index) as HexagonalCell;
				var currentCell:ICell = null;
				var cIndex:int = 0;
				var rIndex:int = 0;
				if (0 == c.getRowIndex() % 2)
				{
					/* Rows to the rleft
					*
					*                __     __
					*              / * \__/ * \__
					*              \__/   \__/   \
					*             / * \__/ * \__/
					*             \__/   \__/   \
					*            / * \__/ * \__/
					*            \__/   \__/
					*
					*/
					for (rIndex = -2; rIndex < 3; rIndex++)
					{
						for (cIndex = -1; cIndex < 1; cIndex++)
						{
							currentCell = null;
							if ((rIndex != 0) || (cIndex != 0))
							{
								
								if (cIndex  == -1)
								{
									if ((rIndex == 1) || (rIndex == -1))
									{
										currentCell = getCellByPosition(c.getRowIndex() + rIndex, c.getColIndex() + cIndex);
									}
								}
								else
								{
									currentCell = getCellByPosition(c.getRowIndex() + rIndex, c.getColIndex() + cIndex);
								}
							}
							if (currentCell != null)
							{
								c.addNeighbour(currentCell);
							}
						}
					}
					
				} 
				else
				{
					/* Rows to the right
					*
					*                __     __
					*              /   \__/   \__
					*              \__/ * \__/ * \
					*             /   \__/   \__/
					*             \__/ * \__/ * \
					*            /   \__/   \__/
					*            \__/   \__/
					*
					*/
					for (rIndex = -2; rIndex < 3; rIndex++)
					{
						for (cIndex = 0; cIndex < 2; cIndex++)
						{
							currentCell = null;
							if ((rIndex != 0) || (cIndex != 0))
							{
								
								if (cIndex  == 0)
								{
									if ((rIndex == 1) || (rIndex == -1))
									{
										currentCell = getCellByPosition(c.getRowIndex() + rIndex, c.getColIndex() + cIndex);
									}
								}
								else
								{
									currentCell = getCellByPosition(c.getRowIndex() + rIndex, c.getColIndex() + cIndex);
								}
							}
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