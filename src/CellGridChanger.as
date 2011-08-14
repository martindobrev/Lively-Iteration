package
{
	public class CellGridChanger
	{
		private var _grid:ICollection;
		
		public function CellGridChanger(grid:ICollection)
		{
			_grid = grid;
		}
		
		public function changeGrid() : void
		{
			var it:IGridIterator = _grid.iterator();
			while(it.hasNext())
			{
				var cell:ICell = it.next();
				var neighbours:Vector.<ICell> = cell.getNeighbours();
				var sum:uint = 0;
				for (var i:int = 0; i < neighbours.length; i++)
				{
					if (neighbours[i].getColor() == 0x000000)
					{
						sum++;
					}
				}
				
				if (cell.getColor() == 0x000000)
				{
					if ((sum < 2) || (sum > 3))
					{
						cell.setNextColor(0xffffff);
					}
					else
					{
						cell.setNextColor(0x000000);
					}
				}
				else
				{
					if (sum == 3)
					{
						cell.setNextColor(0x000000);
					}
					else
					{
						cell.setNextColor(0xffffff);
					}
				}
			}
			
			it = _grid.iterator();
			while (it.hasNext())
			{
				it.next().toNextGeneration();
			}
			_grid.redraw();
		}
	}
}