package
{
	import flash.display.Sprite;
	
	public class AbstractGrid extends Sprite implements ICollection
	{
		
		protected var rows:int;
		protected var cols:int;
		protected var size:int;
		
		public function AbstractGrid(rows:int = 10, cols:int = 10, size:int = 10)
		{
			super();
			this.rows = rows;
			this.cols = cols;
			this.size = size;
			this.initGrid();
		}
		
		protected function initGrid() : void
		{
			// OVERWRITE THIS METHOD TO CREATE A SPECIAL GRID
		}
		
		/**
		 * Recalculates grid state
		 */ 
		public function redraw() : void
		{
			for (var i:int = 0; i < this.numChildren; i++) 
			{
				var cell:ICell = this.getChildAt(i) as ICell;
				//cell.setColor(cell.getColor() - Math.random() * 3000);
				cell.draw();
			}
		}
		
		/* OVERWRITE THIS METHOD TO RETURN A PROPER ITERATOR IF NECESSARY */
		public function iterator() : IGridIterator
		{
			var cells:Vector.<ICell> = new Vector.<ICell>();
			for (var i:int = 0; i < this.numChildren; i++)
			{
				cells.push(this.getChildAt(i));
			}
			var iterator:IGridIterator = new CellGridIterator(cells, rows);
			return iterator;
		}
		
		protected function getCellByPosition(row:int, col:int) : ICell
		{
			var toReturn:ICell = null;
			for (var i:int = 0; i < this.numChildren; i++)
			{
				var cell:ICell = this.getChildAt(i) as ICell;
				if ((cell.getRowIndex() == row) && (cell.getColIndex() == col))
				{
					toReturn = cell;
					break;
				}
			}
			return toReturn;
		}
	}
}