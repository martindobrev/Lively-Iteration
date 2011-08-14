package
{
	public class CellGridIterator implements IGridIterator
	{
		private var _cells:Vector.<ICell>;
		private var _rows:int;
		private var _index:uint;
		
		public function CellGridIterator(cells:Vector.<ICell>, rows:int) 
		{
			_cells = cells;
			_rows = rows;
			_index = 0;
		}		
		
		public function next() : ICell
		{
			_index++;
			return _cells[_index];
		}
		
		public function hasNext() : Boolean
		{
			return (_index + 1) < _cells.length;
		}
	}
}